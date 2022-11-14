public class NewStudentsBatchBatch implements Database.Batchable<SObject> , Database.Stateful{
    public Database.QueryLocator start(Database.BatchableContext Param1){
        return Database.getQueryLocator([SELECT Id, First_Name__c, Last_Name__c, Applied_For__c, Application_Processing_Done__c, Seat_Allotment_Status__c, Qualifying_Marks__c, Seat_Allotment_Process_Completed__c, Status__c, Email__c FROM Student_Application__c where Status__c = 'Admitted' AND Application_Processing_Done__c = false]);
    }
    public void execute(Database.BatchableContext Param1, List<Object> Param2){
        List<Student__c> NewStudents = new List<Student__c>();
        List<Student_Application__C> applications = (List<Student_Application__C>) param2;
       // for(Student__c stdList : NewStudents){
            for(Student_Application__C app : applications){
                Student__c std = new Student__c();
                std.First_Name__c = app.First_Name__c;
                std.Last_Name__c = app.Last_Name__c;
                NewStudents.add(std);
            }
        system.debug('@@NewStudents@@' +NewStudents);
            insert NewStudents;
        //}
    }
    public void finish(Database.BatchableContext param1) {
    }
}