public with sharing class AccountController {
    public AccountController() {

    }
    @AuraEnabled
    public static List<Account> getAccounts(){
            return [select id,name,type,phone,industry from Account limit 50];
    }
}
