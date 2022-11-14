trigger VisitTrigger3 on Visit__c (before insert) {
    Set<Id> accIdSet = new Set<Id>();
    List<Visit__c> VstLst = new List<Visit__c>();
    
    
    if(Trigger.isBefore && Trigger.isInsert) {
        List<Visit__c> newVisit = Trigger.new;
        for(Visit__c vst : newVisit) {
            vst.Is_Latest__c = True;  
            accIdSet.add(vst.Account__c);
            
                
        List<Visit__c> visitList = [SELECT Id, Name, CreatedDate FROM Visit__c WHERE Account__c IN : accIdSet];
        for(Visit__c newVstlist : newVisit){
            for(Visit__c oldVstList : visitList){
                if(newVstlist.CreatedDate != oldVstList.CreatedDate){
                   newVstlist.addError('Cannont insert more than 1 child record.');
                }
            }
}
    }
}
}