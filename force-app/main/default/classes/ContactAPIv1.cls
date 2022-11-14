@RestResource(urlMapping='/v1/contacts')
global class ContactAPIv1 {
    
    @HttpGet
    global static Contact getContactById(){
        RestRequest req = RestContext.request;
        RestResponse resp = RestContext.response;
        
        String reqURI = req.requestURI;
        
        Map<String,String> params = req.params;
        for(String key : params.keySet()) {
            system.debug('Key :'+ key + 'value :'+params.get(key));
        }
        String firstName = params.get('firstName');
        String lastName = params.get('lastName');
        String email = params.get('email');
        
        if(String.isBlank(firstName) || String.isBlank(lastName) || String.isBlank(email)){
            resp.statusCode =  400;
            throw new ContactAPIException('{"error" :"mandatory fields are missing"}');
        }
        String contactId = reqURI.substringAfterLast('/');
        
        return [SELECT Id,FirstName,LastName,Email FROM Contact WHERE Id = :contactId];
    }
    
    @HttpPost
    global static List<ContactResponse> createContact(List<nameDetails> data, locationDetails address){
        List<Contact> conList = new List<Contact>();
        List<ContactResponse> crList = new List<ContactResponse>();
        for(nameDetails name : data){
            Contact con = new Contact();
            con.FirstName = name.firstName;
            con.LastName = name.lastName;
            con.Email = name.email;
            con.MailingCity = address.city;
            con.MailingStreet = address.streetName;
            con.MailingPostalCode = address.postcode;
            conList.add(con);
        }
        insert ConList;
        
        for(Contact c : conList){
          ContactResponse cr = new ContactResponse();
            try {
                cr.insertedId = c.Id;
                crList.add(cr);
            }
            catch (Exception ex){
                cr.error = ex.getMessage();
                crList.add(cr);
            }
        }
        return crList;
        
    } 
    global class contactDetails{
        global List<nameDetails> data;
        global locationDetails address;
    }
    global class nameDetails{
        global String firstName;
        global String lastName;
        global String email;
    }
    global class locationDetails{
        global String streetName;
        global String city;
        global String postcode;
    }
    
    global class ContactResponse {
        global String insertedId;
        global String error;
    }
    public class ContactAPIException extends Exception{
        
    }
}