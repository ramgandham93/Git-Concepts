public  class AccountLWCHandler {

    @AuraEnabled
    public static Boolean saveAccount(String accountName,String description,String accountNumber,String site,String type){
        Account acc = new Account() ;
        try {
            acc.Name = accountName;
            acc.Description = description;
            acc.AccountNumber = accountNumber;
            acc.Site = site;
            acc.Type = type;

            insert acc;
            System.debug('@@@@@@ Account Record Created @@@@ '+acc);
        }catch(Exception e) {
            return false;
        }
        return true;
    }
}