trigger AccountTrigger on Account (before insert) {
    for(Account acc : Trigger.New){
        acc.Description='Record Saved Successfully';
    }
}