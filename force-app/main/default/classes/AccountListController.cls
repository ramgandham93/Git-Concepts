public with sharing class AccountListController {
    @AuraEnabled
    public static List<Account> getAccountsDetails(){
        return [SELECT Id, Name, Description, Website FROM Account ORDER BY Name];
    }
}
