trigger CaseTrigger on Case (before insert, before update) {
    if(Trigger.isBefore && Trigger.isInsert){
        List<Case> Cases = Trigger.new;
        for(Case caseDesc : Cases) {
            caseDesc.Description = '';
        }
    }
}