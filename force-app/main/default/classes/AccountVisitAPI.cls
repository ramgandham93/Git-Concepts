@RestResource(urlMapping='/v1/Accounts')
global class AccountVisitAPI {
    
    @HttpPost
    global static List<AccountResponse> createAccount(List<accountDetails> accs){
        List<Account> accList = new List<Account>();
        List<Visit__c> visitsList = new List<Visit__c>();
        List<AccountResponse> arList = new List<AccountResponse>();
        for(accountDetails ad : accs){
            
            Account acc = new Account();
            acc.Name = ad.accountName;
            acc.Phone = ad.phone;
            accList.add(acc);
        }
        insert accList;
        system.debug('accList'+accList);
        
        Set<Id> accIds = new Set<Id>();
        List<Account> aclst = [Select Id from Account where Id in :accList];
        system.debug('aclst'+aclst);
        //for(Account ac : aclst){
        Integer i = 0;
        for(accountDetails ad : accs){
            String accountId = accList.get(i).Id;
            for(visitRecords vr : ad.visits){
                Visit__c vt = new Visit__c();
                vt.Visit_Date__c = vr.visitDate;
                vt.Account__c = accountId;
                visitsList.add(vt);
            }
            i++;
        }
        
        insert visitsList;
        
        for(Account a : accList){
            AccountResponse ar = new AccountResponse();
            try {
                ar.id = a.Id;
                arList.add(ar);  
            } catch (Exception ex) {
                ar.error = ex.getMessage();
                arList.add(ar);
            }
        }
        return arList;
    }
    
    global class accountsList{
        global List<accountDetails> accs;
        
    }
    
    global class accountDetails{
        global String accountName;
        global String phone;
        global List<visitRecords> visits;
    }
    
    global class visitRecords{
        global date visitDate;
        global id accountid;
    }
    
    global class AccountResponse{
        global String id;
        global String error;
    }
}