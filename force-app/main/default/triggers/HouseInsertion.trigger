trigger HouseInsertion on House__c (before insert,after insert, before update) {
    if(Trigger.isBefore && Trigger.isInsert){
        HouseInsertion.houseInsertMethod(Trigger.new);
    }
    if(Trigger.isUpdate){
        HouseInsertion.houseUpdateMethod(Trigger.new);
    }
}