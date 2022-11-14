trigger OpportunityInsert on Opportunity (before insert, before update) {
            if(Trigger.isBefore && Trigger.isInsert) {
        List<Opportunity> newOpportunities = Trigger.new;
        for(Opportunity opty : newOpportunities) {
        	opty.Amount = 0;    
        }
  }
            if(Trigger.isBefore && Trigger.isUpdate){
            List<Opportunity> newOpportunities = Trigger.new;
            for(Opportunity opty : newOpportunities) {
            Opportunity opp = Trigger.oldMap.get(opty.Id);
                if(opty.StageName == 'Qualification' && opp.StageName == 'Prospecting'){
                    opty.Amount = 1000;
                }
                if(opty.StageName == 'Needs Analysis' && opp.StageName == 'Qualification'){
                    opty.Amount = 2000;
                }
            }
            }
    }
/**Opportunity is inserted => amount is 0
opty is updated from stage Prospecting to Qualification => 1000
opty is updated from Qualification to Needs Analysis	=> 2000
opty closedate is updated => 2000**/