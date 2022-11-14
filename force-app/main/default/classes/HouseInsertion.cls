public class HouseInsertion {
    public static void houseInsertMethod(List<House__c> hct){
        RecordType flat = [ SELECT Id, Name FROM RecordType WHERE sObjectType = 'House__c' and Name ='Flat'];
        RecordType terrace = [SELECT Id,Name FROM RecordType WHERE sObjectType = 'House__c' and Name ='Terrace'];
        RecordType individual = [SELECT Id,Name FROM RecordType WHERE sObjectType = 'House__c' and Name ='Individual'];
        System.debug('before loop: Flat&&Terrace&&Individual'+flat+'---'+terrace+'---'+individual);
        for(House__c hcc:(List<House__c>) Trigger.New){ 
            if(hcc.RecordTypeId == flat.Id)
            {
                hcc.House_Type__c = flat.Name;               
            }
            else if(hcc.RecordTypeId == terrace.Id)
            {
                hcc.House_Type__c = terrace.Name;               
            }
            else
                hcc.House_Type__c = individual.Name;
        }
        for(House__c hcct:(List<House__c>) Trigger.New){
            if(hcct.Convert_to_Flat__c == true){
                hcct.House_Type__c = flat.Name ;
            } 
        }
    }
    public static void houseUpdateMethod(List<House__c> hct){
        RecordType flat = [ SELECT Id, Name FROM RecordType WHERE sObjectType = 'House__c' and Name ='Flat'];
        for(House__c hcct:(List<House__c>) Trigger.New){
            if(hcct.Convert_to_Flat__c == true){
                hcct.House_Type__c = flat.Name ;
            } 
        }
    }
}