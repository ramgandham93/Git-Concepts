trigger playerHandler on Player__c (after insert) {
if(trigger.isAfter){
        If(trigger.isInsert){
           playerHandler.afterInsert(trigger.new);
        }

}
}