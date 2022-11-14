public class playerHandler {

   public static void afterInsert(List<Player__c> play){
        List<Player_Monthly_Fee__c> fee = new List<Player_Monthly_Fee__c>();
        Date startDate;
        Decimal payment;
        for(Player__c pl : play){
           startDate = pl.Enrollment_Date__c;
        }
        
        List<Fees__c> fees = [Select id,Fee__c,From_Date__c,Month__c from Fees__c];
        for(Fees__c f : fees){
            if(f.From_Date__c.month() - startDate.month() == 0 ){
                payment = f.Fee__c;
                system.debug('@@@'+payment);
            }
            system.debug('@@@'+payment);
        }
        
        for(Player__c player : play){
            for(Integer i = 0; i <3 ;i++) {
                Player_Monthly_Fee__c monthFee = new Player_Monthly_Fee__c();
                monthFee.Player__c = player.id;
                monthFee.Total_Fees__c = payment;
                monthFee.Fees_Paid__c = 0;
                monthFee.Payment_Date__c = startDate;
                monthFee.Balance__c = payment - monthFee.Fees_Paid__c;
                monthFee.Fees_Paid__c = monthFee.Total_Fees__c - monthFee.Balance__c;
                monthFee.Fees_to_be_Paid__c = monthFee.Balance__c;
                monthFee.Months__c = startDate.month();
                fee.add(monthFee);
                startDate = startDate.addMonths(1);
               	
                
                
            }
            system.debug(fee);
       insert fee; 
          }
        
    }
}