trigger ApiCallOnContact on Contact (after insert) {
    if(Trigger.isAfter && Trigger.isInsert){
        List<Id> contactIds = new List<Id>();
        for(Contact ct : Trigger.new){
            contactIds.add(ct.Id);
        }
        //contactFirstnameCallApi.contactFirstnameCall(contactIds);
       // contactProbabilityApiCall.contactProbability(contactIds);
    }
}