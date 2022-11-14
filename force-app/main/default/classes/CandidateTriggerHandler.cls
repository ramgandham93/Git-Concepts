public class CandidateTriggerHandler  {

public static void beforeInsert(List<Candidate_Application__c> ac) {
    Set<Id> levelId = new Set<Id>(); 
    String nameOfSport;
    for(Candidate_Application__c cs : ac){
          if(cs.Level_Of_Sport__c == NULL && cs.Sport__c == NULL){
              cs.addError('You need to enter your Sport and Your Level');
          }Else{
              levelId.add(cs.Level_Of_Sport__c);
              system.debug('sportLevelID'+ levelId);
          }
    }
    List<Level_Of_Sport__c> level = [Select Name From Level_Of_Sport__c where id In :levelId];
    for(Level_Of_Sport__c nameSport : level){
        nameOfSport = nameSport.Name;
        system.debug('LevelName'+nameOfSport);
    }
     for(Candidate_Application__c cs : ac){
          if(nameOfSport == 'Basic' && cs.Age__c > 12){
             cs.Application_Status__c = 'Accepted';
           }ELSE IF(nameOfSport == 'Junior' && cs.Age__c > 18){
             cs.Application_Status__c = 'Accepted';
           }ELSE IF(nameOfSport== 'Senior' && cs.Age__c > 24){
             cs.Application_Status__c = 'Accepted';
           }
          ELSE{
              CS.Application_Status__c = 'Rejected';
          }

      }
  
}
    public static void afterInsert(List<Candidate_Application__c> ac) {
      List<Person__c>perList=new List<Person__c>();
        for(Candidate_Application__c acc:ac){
            if(acc.Application_Status__c == 'Accepted'){
            Person__c per=new Person__c();
            per.First_Name__c = acc.First_Name__c;
            per.Last_Name__c = acc.Last_Name__c;
            per.Date_Of_Birth__c= acc.Date_Of_Birth__c;
            per.City__c = acc.City__c;
            per.Address__c = acc.Address__c;
            per.Mobile__c = acc.Mobile__c;
            per.Email__c = acc.Email__c;
            per.Candidate_Application__c = acc.Id;
            perList.add(per);
            }
        }
        insert PerList;
      }
}