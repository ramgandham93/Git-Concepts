public class PersonTriggerHandler {
    
    public static void afterInsert(List<Person__c> person){
      List<Player__c>perList=new List<Player__c>();
      Date createDate;
      SET<ID> candidateApplication = NEW Set<Id>();
      List<Person__c> pers = [Select id,CreatedDate,Candidate_Application__c From Person__c where id  IN : person];
        for(Person__c dat : pers){
            createDate = dat.CreatedDate.Date();
            candidateApplication.add(dat.Candidate_Application__c);
            system.debug(candidateApplication);
         }
     List<Candidate_Application__c> ca = [SELECT id,Sport__c,Sport_Level__c From Candidate_Application__c WHERE ID IN : candidateApplication];
      ID sportId;
      ID levelId;
        for(Candidate_Application__c cs : ca){
            sportId = cs.Sport__c;
            levelId = cs.Sport_Level__c;
            system.debug(sportId);
            system.debug(levelId);
        }
        for(Person__c per : person){
          Player__c play=new Player__c();
            play.First_Name__c = per.First_Name__c;
            play.Last_Name__c = per.Last_Name__c;
            play.Person_Id__c= per.id;
           	play.Enrollment_Date__c = createDate;
            play.Sports__c = sportId;
            play.Sport_Level__c = levelId;
            perList.add(play);
            system.debug(perList);
            }
        insert PerList;
        }
        
      }