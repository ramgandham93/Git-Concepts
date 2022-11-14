public class StudentSeatAllocationBatch implements Database.Batchable<SObject> , Database.Stateful{
    Set<string> emailIds = new Set<string>();
    public Database.QueryLocator  start(Database.BatchableContext param1) {
        return Database.getQueryLocator(
                'SELECT Id, ' +
                        'Email__c, ' +
                        'First_Name__c, ' +
                        'Status__c, ' +
                        'Seat_Allotment_Process_Completed__c, ' +
                        'Applied_For__c, ' +
                        'Application_Processing_Done__c, ' +
                        'Qualifying_Marks__c, ' +
                        'Name ' +
                        'FROM ' +
                        'Student_Application__c ' +
                        'Where ' +
                        'Seat_Allotment_Process_Completed__c = false');
    }

    public void execute(Database.BatchableContext param1, List<Object> param2) {
        List<Student_Application__C> applicationsForUpdate =  new List<Student_Application__C>();
        List<Student_Application__C> applications = (List<Student_Application__C>) param2;
        for(Student_Application__C app : applications) {
            if(app.Qualifying_Marks__c != NULL && app.Qualifying_Marks__c >= 200) {
                app.Seat_Allotment_Status__c = 'Accepted';
            }
            else {
                app.Seat_Allotment_Status__c = 'Rejected';
            }
            app.Seat_Allotment_Process_Completed__c = true;
            applicationsForUpdate.add(app);
            emailIds.add(app.Email__c);
        }
        update applicationsForUpdate;
    }

    public void finish(Database.BatchableContext param1) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

        // Strings to hold the email addresses to which you are sending the email.
        String[] toAddresses = new String [emailIds.size()];
        Integer i = 0;
        for(String em : emailIds) {
            toAddresses[i++] = em;
        }
        mail.setToAddresses(toAddresses);
        mail.setReplyTo('support@acme.com');
        mail.setSenderDisplayName('Salesforce Support');
        mail.setSubject('Your Application is processed ');
        mail.setBccSender(false);
        mail.setPlainTextBody('Your has been Processed.');
        mail.setHtmlBody('Your has been Processed.');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }


}