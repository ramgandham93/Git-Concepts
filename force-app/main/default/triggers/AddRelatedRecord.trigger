trigger AddRelatedRecord on Account (After insert, After update) {
    List<Opportunity> oppList = new List<Opportunity>();
    Map<Id,Account> acctswithopps = new Map<Id,Account>([SELECT Id,(SELECT Id FROM Opportunities)from Account WHERE Id IN :Trigger.new]);
    for(Account a : Trigger.new){
        System.debug('acctswithopps.get(a.Id).Opportunities.size()=' + acctswithopps.get(a.Id).Opportunities.size());
        if(acctswithopps.get(a.Id).Opportunities.size() == 0){
            oppList.add(new Opportunity(Name = a.Name + ' Opportunity  ', StageName = 'Prospecting', CloseDate = System.today().addmonths(1), AccountId = a.Id));
        }
    }
    if(oppList.size() > 0){
        insert oppList;
    }
    }