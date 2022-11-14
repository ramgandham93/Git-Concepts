trigger VisitTrigger on Visit__c (before update, before insert, after insert, after update) {
    Set<Id> accIdSet = new Set<Id>();
    List<Visit__c> VstLst = new List<Visit__c>();
    
    
    if(Trigger.isBefore && Trigger.isInsert) {
        List<Visit__c> newVisit = Trigger.new;
        for(Visit__c vst : newVisit) {
            vst.Is_Latest__c = True;  
            accIdSet.add(vst.Account__c);
            System.debug('@@accIdSet@@'+accIdSet);
        }   
    }
    if(Trigger.isAfter && Trigger.isInsert){
        Set<Id> accIdSet = new Set<Id>();
        List<Visit__c> newVisitList = Trigger.new;
        for(Visit__c visit : newVisitList) {
            accIdSet.add(visit.Account__c);
            
        Trigger.newMap.keySet();
        List<Visit__c> visitList = [SELECT Id,Is_Latest__c FROM Visit__c WHERE Account__c IN : accIdSet AND Id NOT IN :Trigger.new];
        System.debug('@@visitList@@'+visitList);
        for(Visit__c vLst : visitList){
            vLst.Is_Latest__c = False;
            VstLst.add(vLst);
            
        }
        System.debug('@@VstLst@@'+VstLst);
        update VstLst;
    }
    
}
}