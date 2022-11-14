public with sharing class FileCreationServiceController {
    @AuraEnabled
    public static Id downloadCSVForAccounts() {
        List<String> CSVHEADERS = new List<String>{'Id','Name'};
        Id fileId = FileUtil.createCSV(CSVHeaders, [SELECT Id, Name From Account LIMIT 25], 'Testing File 1');
        return fileId;
    }
}