@IsTest // annotation
private class OptyChildAmountTest {
	
    // When we insert an opty child, the opty child amount should not change
    @IsTest
    static void testShouldNotChangeWhenOptyChildIsInserted(){
        // Given
        Opportunity opp1 = new Opportunity();
        opp1.Name = 'something';
        opp1.StageName = 'Prospecting';
        opp1.CloseDate = System.today();
        insert opp1;
        
        // When
		Opportunity_Child__c child = new Opportunity_Child__c();
		child.Opportunity__c = opp1.Id;
        insert child;
        
        // Then
        Opportunity_Child__c childAgain = [SELECT Id, Child_Amount__c FROM Opportunity_Child__c WHERE Id = :child.Id];
		System.assertEquals(0, childAgain.Child_Amount__c, 'Child amount is not 0');
    }
    
    // When we change opty name, then opty child amount should not change
    @IsTest
    static void testShouldNotChangeWhenOptyNameChanges() {
        // Given
		Opportunity opp1 = new Opportunity();
        opp1.Name = 'something';
        opp1.StageName = 'Prospecting';
        opp1.CloseDate = System.today();
        insert opp1;
        Opportunity_Child__c child = new Opportunity_Child__c();
		child.Opportunity__c = opp1.Id;
        insert child;
        
        // When
		opp1.Name = 'changed';
        update opp1;
        
        // Then
        Opportunity_Child__c childAgain = [SELECT Id, Child_Amount__c FROM Opportunity_Child__c WHERE Id = :child.Id];
        System.assertEquals(0, childAgain.Child_Amount__c, 'child amount has not changed');
    }
    
    // When there is an opty child and we update the opty amount
    // then the child amount should be incremented by 200
    @IsTest
    static void testShouldIncrementChildAmountBy200For1Child() {
        // Given
		Opportunity opp1 = new Opportunity();
        opp1.Name = 'something';
        opp1.StageName = 'Prospecting';
        opp1.CloseDate = System.today();
        insert opp1;
        
        Opportunity_Child__c child = new Opportunity_Child__c();
		child.Opportunity__c = opp1.Id;
        insert child;
        
        // When
		opp1.Amount = 200;
        update opp1;
        
        // Then
        Opportunity_Child__c ChildAmountBy200For1Child = [SELECT Id, Child_Amount__c FROM Opportunity_Child__c WHERE Id = :child.Id];
        ChildAmountBy200For1Child.Child_Amount__c = +200;
        
    }
    
    // When there are multple opty children and we update the opty amount
    // then the children amount should all be incremented by 200 each
    @IsTest
    static void testShouldIncrementChildAmountBy200ForMultipleChildren() {
        // Given
		Opportunity opp1 = new Opportunity();
        opp1.Name = 'something';
        opp1.StageName = 'Prospecting';
        opp1.CloseDate = System.today();
        insert opp1;
        
        Opportunity_Child__c child1 = new Opportunity_Child__c();
		child1.Opportunity__c = opp1.Id;
        Opportunity_Child__c child2 = new Opportunity_Child__c();
        child2.Opportunity__c = opp1.Id;
        Opportunity_Child__c child3 = new Opportunity_Child__c();
        child3.Opportunity__c = opp1.Id;
        
        List<Opportunity_Child__c> oppChildList = new List<Opportunity_Child__c>();
        oppChildList.add(child1);
        oppChildList.add(child2);
        oppChildList.add(child3);
        insert oppChildList;
        
        // When
		opp1.Amount = 400;
        update opp1;
        
        System.debug(' @@@@ ' +  [SELECT Id, Child_Amount__c FROM Opportunity_Child__c WHERE Id IN :oppChildList]);
        
        // Then
        Trigger.newMap.keySet();
        Set<Id> oppIdSet = Trigger.newMap.keySet();
        List<Opportunity_Child__c> ChildAmountBy200ForMultipleChildren = [SELECT Id, Child_Amount__c FROM Opportunity_Child__c WHERE Id IN :oppIdSet];
        List<Opportunity_Child__c> newList = new List<Opportunity_Child__c>();
        for (Opportunity_Child__c cldLst :ChildAmountBy200ForMultipleChildren) {
            cldLst.Child_Amount__c = cldLst.Child_Amount__c +200;
            newList.add(cldLst);
}
    }
    
    // When there are 3 opportunities and we update all these 2 opty amounts
    // then all the children of these 3 optys should be incremented by 200 each
    @IsTest
    static void testShouldIncrementChildAmountForMultipleOpportunities() {
        
    }
}