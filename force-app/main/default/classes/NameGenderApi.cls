public class NameGenderApi {
    Public static void createMultipleContacts(Integer a){
        List<Contact> conList = new List<Contact>();
        for(integer i=0;i<a;i++){
            Http h = new Http();
            
            HttpRequest req = new HttpRequest();
            req.setMethod('GET');
            req.setEndpoint('https://randomuser.me/api/');
            
            HttpResponse res = h.send(req);
            System.debug('res :' + res);
            
            Integer statusCode = res.getStatusCode();
            System.debug('statusCode :' + statusCode);
            
            String body = res.getBody();
            System.debug('body :' + body);
            
            Results rlt = (Results)system.JSON.deserialize(body,Results.class);
            System.debug('Contactsrecord :'+ rlt);
            string gender,first,last,title,phone,city,state,country;
            for(PersonalDetails pd :rlt.results){
                gender = pd.gender;
                first = pd.name.first;
                last = pd.name.last;
                title = pd.name.title;
                phone = pd.phone;
                city = pd.location.city;
                state = pd.location.state;
                country = pd.location.country;
            }
            Contact con = new Contact();
            con.FirstName = first;
            con.LastName = last;
            con.Title = title;
            con.Phone = phone;
            con.MailingCity = city;
            con.gender__c = gender;
            con.MailingState = state;
            con.MailingCountry = country;
            conList.add(con);
        }  
        insert conList;
        system.debug('Contact inserted List is:'+conList);
    }

    public class Results{
        public List<PersonalDetails> results;
    }
    public class PersonalDetails{
        public String gender;
        public nameDetails name;
        
        public locationDetails location;
        public String phone;
    }
    public class nameDetails{
        public String title;
        public String first;
        public String last;
    }
    public class locationDetails{
        public streetDetails street;
        public string city;
        public string state;
        public string country;
    }
    public class streetDetails{
        public integer numbers;
        public string name;
    }
}