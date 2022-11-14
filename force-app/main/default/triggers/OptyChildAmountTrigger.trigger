trigger OptyChildAmountTrigger on Opportunity (before update) {
    // Trigger.old -> filter this to find:
	// 1. Check if opty amount has changed
	List<Opportunity> optysWhoseAmountHasChanged = new List<Opportunity>();
    // Write some code to add all Opportunities whose amount has changed into optysWhoseAmountHasChanged
    for(Opportunity oldOpty : Trigger.old) {
        Opportunity newOpty = Trigger.newMap.get(oldOpty.Id);
        if(oldOpty.Amount != newOpty.Amount) {
            System.debug('line no :9');
            optysWhoseAmountHasChanged.add(newOpty);
        }
    }
    
	// 2. Fetch all the Opportunity_Child records of optysWhoseAmountHasChanged
	List<Opportunity_Child__c> optyChildrenToBeIncremented;
    // Write some code here to add all the Opportunity_Children from above SOQL into optyChildrenToBeIncremented
	optyChildrenToBeIncremented = [SELECT Id,Child_Amount__c 
                                   FROM Opportunity_Child__c 
                                   WHERE Opportunity__c IN :optysWhoseAmountHasChanged];
    
    // 3. Increment the Child_Amount__c by 200 for all Opportunity_Children of above - optyChildrenToBeIncremented
    for(Opportunity_Child__c oc : optyChildrenToBeIncremented) {
        oc.Child_Amount__c += 200;
	}
    
    // 4. DML
    update optyChildrenToBeIncremented;
}