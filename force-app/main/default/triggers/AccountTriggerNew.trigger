trigger AccountTriggerNew on Customer (before insert,after insert,before update,after update,before delete,after delete) 
{
    if(trigger.isBefore)
    {
      if(trigger.isInsert && trigger.isUpdate)
        {
            AccountTrigger.AccountMethod(trigger.new);
        }
    }
}