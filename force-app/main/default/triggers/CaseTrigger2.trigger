trigger CaseTrigger2 on Case (before insert) {
        if(Trigger.isBefore && Trigger.isInsert) {
        List<Case> newCases2 = Trigger.new;
        for(Case cs : newCases2) {
        	cs.Description  = '';    
        }
  }
            if(Trigger.isBefore && Trigger.isUpdate){
            List<Case> newCases2 = Trigger.new;
            for(Case cs : newCases2) {
            Case css = Trigger.oldMap.get(cs.Id);
                if(cs.Description == ''){
                    cs.Description = 'Hello';

                }
            }
            }
    }