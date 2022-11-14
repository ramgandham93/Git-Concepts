public class VisitBatch implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT Id, Visit_Date__c, Account__c FROM Visic__c');
    }
    public void execute(Database.BatchableContext bc, List<Visit__c> visitList){
        Set<Id> accIds = new Set<Id>();
        for(Visit__c vst : visitList){
            accIds.add(vst.Account__c);
        }
        Map<Id,Visit__c> accIdstoLatestVisitMap = new Map<Id,Visit__c>();
        for(Visit__c vst : [SELECT Id, Visit_Date__c, Account__c FROM Visit__c WHERE Account__c IN :accIds]){
            if(accIdstoLatestVisitMap.containsKey(vst.Account__c)){
                Visit__c visitExistingMap = accIdstoLatestVisitMap.get(vst.Account__c);
                if(vst.Visit_Date__c >= visitExistingMap.Visit_Date__c){
                    accIdstoLatestVisitMap.put(vst.Account__c, vst);
                }
            }else{
                accIdstoLatestVisitMap.put(vst.Account__c, vst);
            }
        }
        List<Visit__c> deleteVisits = new List<Visit__c>();
        for(Visit__c vst : visitList){
            Visit__c latestVisits = accIdstoLatestVisitMap.get(vst.Account__c);
            if(vst.Id != latestVisits.Id){
                deleteVisits.add(vst);
            }
        }
    }
    public void finish(Database.BatchableContext bc){
    }
}