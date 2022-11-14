@isTest
public class contactFirstnameCallApiTest {
    @isTest
    static void contactGenderUpdate(){
        Contact con = new Contact();
        con.FirstName = 'Ram';
        con.LastName = 'G';
        insert con;
        List<Id> contactsIds = new List<Id>();
        contactsIds.add(con.Id);
        
        String expectedGender = 'male';
        contactFirstnameCallApiMock mock = new contactFirstnameCallApiMock();
        mock.isError = false;
        test.setMock(HttpCalloutMock.class, mock);
        
        test.startTest();
        contactFirstnameCallApi.contactFirstnameCall(contactsIds);
        test.stopTest();
        
        Contact contactsRes = [SELECT Id,Gender__c FROM Contact WHERE Id =:contactsIds];
        system.assertEquals(expectedGender, contactsRes.Gender__c, 'Success');    
    }
}