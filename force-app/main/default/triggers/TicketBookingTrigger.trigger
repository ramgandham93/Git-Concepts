trigger TicketBookingTrigger on Ticket_Booking__c (before insert,before delete) {
    TicketBookingTriggerHandler handler = new TicketBookingTriggerHandler();
    if(Trigger.isBefore && Trigger.isInsert) {
        handler.performBeforeInsertOperation(Trigger.new);
    }
    if(Trigger.isBefore && Trigger.isDelete) {
        handler.performAfterDeleteOperation(Trigger.old);
    }
}