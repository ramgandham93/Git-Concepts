public class contactProbabilityApiCall {
    
    @Future (callout = true)
    
    public static void contactProbability(List<Id> contactIds){
        List<String> fNameList = new List<String>();
        List<Contact> contactsList = [Select Id,firstName FROM Contact WHERE Id IN :contactIds];
        for(Contact ConFirstName : contactsList){
            Http hr = new Http();
            HttpRequest request = new HttpRequest();
            request.setMethod('GET');
            request.setEndpoint('https://api.nationalize.io/?name='+ConFirstName.firstName);
            
            HttpResponse response = hr.send(request);
            Integer statusCode = response.getStatusCode();
            String body = response.getBody();
            system.debug('body :'+ body);
            system.debug('statusCode :'+ statusCode);
            system.debug('response :'+ response);
            
            country pro = (country) JSON.deserialize(body, country.class);
            List<countryProbability> CPTY = pro.country;
            Decimal maxValue = 0;
            String CountryId;
            for(countryProbability CP : CPTY){
                if(cp.probability > maxValue){
                    maxValue = cp.probability;
                    CountryId = cp.country_id;
                }
            }
            ConFirstName.Country_Code__c = CountryId;
        }
        update contactsList;
    }
    public class country{
        public List<countryProbability>country;
        public String name;
    }
    public class countryProbability {
        public String country_id;
        public Decimal probability;
    }
}