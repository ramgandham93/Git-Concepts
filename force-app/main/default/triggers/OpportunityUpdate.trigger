trigger OpportunityUpdate on Opportunity (before update) {
     System.debug('OpportunityInsert new:' + Trigger.new);
    }