Public Class AccountTrigger{

   public static void AccountMethod(List<Customer>records)
    {
        Id emea = Schema.SObjectType.Customer.getRecordTypeInfosByName().get('EMEA').getRecordTypeId();
        Id apac = Schema.SObjectType.Customer.getRecordTypeInfosByName().get('APAC').getRecordTypeId();
  
    for(Customer cust:records) 
    {
       if(cust.RecordTypeId == emea)
       {
           cust.Reason__c = 'Europe';
       }
      else if(cust.RecordTypeId == apac) 
      {
           cust.Reason__c = 'Asia';
       }
    }
 }
}