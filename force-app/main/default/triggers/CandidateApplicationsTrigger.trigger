trigger CandidateApplicationsTrigger on Candidate_Application__c (before insert,after Insert) {
	if(trigger.isBefore)
    {
      if(trigger.isInsert )
        {
            CandidateTriggerHandler.beforeInsert(trigger.new);
        }
}if(trigger.isAfter)
    {
      if(trigger.isInsert)
        {
            CandidateTriggerHandler.afterInsert(trigger.new);
        }
}
}