trigger AvailabilityTrigger on Availability__c (before insert, before update) {
   /*if(Trigger.isBefore && Trigger.isUpdate){
        List<Bus__c> bsList = new List<Bus__c>();
       system.debug('@4@'+bsList);
        List<Ticket_Booking__c> tbkList = new List<Ticket_Booking__c>();
       system.debug('@4@'+bsList);
        List<Availability__c> newAvailabilitys = Trigger.new;
        for(Availability__c avlList : newAvailabilitys) {
            avlList.Booked_Tickets__c = 0;
        for(Bus__c bslst : bsList){
            for(Ticket_Booking__c tbklst : tbkList){
                if(bslst.Journey_Date__c == tbklst.Journey_Date__c && bslst.Id == tbklst.Id)
                   avlList.Booked_Tickets__c = avlList.Booked_Tickets__c + 1;
            }
        }
    }
}*/
}