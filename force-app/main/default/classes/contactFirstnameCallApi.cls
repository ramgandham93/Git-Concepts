public class contactFirstnameCallApi {
    
    @Future (callout = true)
    
    public static void contactFirstnameCall(List<Id> contactIds){
        Set<String> firstNames = new Set<String>();
        Map<String,String> ContactsMap = new Map<String,String>();
        List<Contact> contactsList = [Select Id,firstName,Gender__c FROM Contact WHERE Id IN :contactIds];
        for(Contact conts : contactsList){
            firstNames.add(conts.FirstName);
        }
        system.debug('firstNames'+firstNames);
        for(Contact ct : [select id,FirstName,Gender__c from Contact Where firstName = :firstNames AND Gender__c != null]){
            ContactsMap.put(ct.FirstName,ct.Gender__c);
        }
        system.debug('ContactsMap'+ContactsMap);
        for(Contact conList : contactsList){
            if(ContactsMap.containsKey(conList.FirstName)){
                conList.Gender__c = ContactsMap.get(conList.FirstName);
            }
            else{
                Http hr = new Http();
                HttpRequest request = new HttpRequest();
                request.setMethod('GET');
                request.setEndpoint('https://api.genderize.io/?name='+conList.FirstName);
                
                HttpResponse response = hr.send(request);
                Integer statusCode = response.getStatusCode();
                String body = response.getBody();
                system.debug('body :'+ body);
                system.debug('statusCode :'+ statusCode);
                system.debug('response :'+ response);
                
                genderize gen = (genderize) JSON.deserialize(response.getBody(), genderize.class);
                
                conList.Gender__c = gen.gender;
                ContactsMap.put(conList.FirstName,gen.gender);
            }
        }
        update contactsList;
    }
    public class genderize {
        public String gender;
    }
}