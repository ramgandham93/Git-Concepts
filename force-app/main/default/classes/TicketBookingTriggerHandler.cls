public with sharing class TicketBookingTriggerHandler {
    public void performBeforeInsertOperation(List<Ticket_Booking__c> ticketBookings) {
        Set<Id> busIds = new Set<Id>();
        Set<Date> dates = new Set<Date>();
        populatRequiredDatesAndBusIds(busIds, dates, ticketBookings);
        List<Availability__c> availabilities = getAvailabilitiesForDatesAndBusIds(busIds, dates);
        List<Availability__c> updatedAvailabilities = new List<Availability__c>();
        reserveTicketsBasedOnAvaiability(availabilities, updatedAvailabilities, ticketBookings);
        update updatedAvailabilities;
    }

    public void reserveTicketsBasedOnAvaiability( List<Availability__c> availabilities,
                                                  List<Availability__c> updatedAvailabilities,
                                                  List<Ticket_Booking__c> ticketBookings)      {
        for(Ticket_Booking__c booking : ticketBookings) {
            Boolean busOnDateFound = false;
            for(Availability__c availability : availabilities) {
                if(availability.Journey_Date__c == booking.Journey_Date__c &&
                        availability.Bus__c == booking.Bus__c) {
                    busOnDateFound = true;
                    if(availability.Available_Seats__c < booking.No_Of_Tickets__c) {
                        booking.addError('Seats not available for given date on the requested bus');
                    }
                    else {
                        if(availability.Booked_Tickets__c != NULL){
                        availability.Booked_Tickets__c = availability.Booked_Tickets__c + booking.No_Of_Tickets__c;
                        updatedAvailabilities.add(availability);
                        }else{
                            availability.Booked_Tickets__c = booking.No_Of_Tickets__c;
                            updatedAvailabilities.add(availability);
                        }
                    }
                }
            }
            if(busOnDateFound == false) {
                booking.addError('There is No Bus available for given date');
            }
        }
    }

    public void populatRequiredDatesAndBusIds(Set<Id> busIds, Set<Date> dates, List<Ticket_Booking__c> ticketBookings) {
        for(Ticket_Booking__c booking : ticketBookings) {
            busIds.add(booking.Bus__c);
            dates.add(booking.Journey_Date__c);
        }
    }

    public List<Availability__c> getAvailabilitiesForDatesAndBusIds(Set<Id> busIds, Set<Date> dates) {
        List<Availability__c> availabilities = [
                SELECT
                        Available_Seats__c,
                        Booked_Tickets__c,
                        Bus__c,
                        CreatedById,
                        CreatedDate,
                        Full_Capacity__c,
                        Id,
                        IsDeleted,
                        Journey_Date__c,
                        LastModifiedById,
                        LastModifiedDate,
                        LastReferencedDate,
                        LastViewedDate,
                        Name,
                        SystemModstamp
                FROM Availability__c
                WHERE    Bus__c IN: busIds
                      OR Journey_Date__c IN: dates];
        return availabilities;
    }
    public void performAfterDeleteOperation(List<Ticket_Booking__c> ticketBookings) {
        system.debug('ticketBookings : '+ticketBookings);
        List<decimal> availcount = new List<decimal>();
        Set<Id> busIds = new Set<Id>();
        integer count = 0;
        for(Ticket_Booking__c tb :ticketBookings){
            availcount.add(tb.No_Of_Tickets__c);
            busIds.add(tb.Bus__c);
        }
        List<Availability__c> avlList = [select Available_Seats_For_Bus__c from Availability__c where Bus__c IN:busIds];
        for(Availability__c avblList :avlList){
            avblList.Available_Seats_For_Bus__c -= availcount.get(count);
            count++;
        }
    }
}