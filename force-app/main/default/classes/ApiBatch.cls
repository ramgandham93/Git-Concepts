public class ApiBatch implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('Select Id,firstName,Gender__c FROM Contact where firstName = !NULL	 and Gender__c = NULL LIMIT 100');
    }
    public void execute(Database.BatchableContext bc, List<Contact> contactList){
        List<Id> contactIdsList = new List<Id>();
        for(Contact con : contactList){
            contactIdsList.add(con.id);
        }
        contactFirstnameCallApi.contactFirstnameCall(contactIdsList);
    }
    public void finish(Database.BatchableContext bc){
    }
}