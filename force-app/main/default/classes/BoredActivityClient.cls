public class BoredActivityClient {
    public void getBoredActivity(){
        Http hr = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://www.boredapi.com/api/activity');
        
        HttpResponse response = hr.send(request);
        Integer statusCode = response.getStatusCode();
        String body = response.getBody();
        
        BoredActivity baa = (BoredActivity) JSON.deserialize(body, BoredActivity.class);
        system.debug('baa : '+baa);
        storeBoredActivity(baa.activity, baa.types, baa.participants,baa.key, baa.price, baa.accessibility);
        
    }
        public void storeBoredActivity(String activity,String types,Integer participants,String key, Decimal price,Decimal accessibility){
            BoredActivity__c ba = new BoredActivity__c();
            ba.BoredActivity__c = activity;
            ba.types__c = types;
            ba.participants__c = participants;
            ba.price__c = price;
            ba.key__c = key;
            ba.accessibility__c = accessibility;
            insert ba;
        }
          
    public class BoredActivity {
            public String activity;
            public String types;
            public Integer participants;
            public Decimal price;
            public String key;
            public Decimal accessibility;
    }

}