trigger PersonTrigger on Person__c (after insert) {
if(trigger.isAfter)
    {
      if(trigger.isInsert)
        {
            PersonTriggerHandler.afterInsert(trigger.new);
        }
}
}