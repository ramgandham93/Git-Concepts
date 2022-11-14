public  class StudentOperationsServiceController {
    @AuraEnabled
    public static Boolean saveStudent(String firstname, String lastName, String gender,String city, String fatherName, Integer teluguMarks, Integer hindiMarks, Integer mathsMarks, Integer socialMarks, Integer englishMarks){
        Student__c stud = new Student__c() ;
        try {
            stud.First_Name__c = firstname;
            stud.Last_Name__c = lastName;
            stud.Gender__c = gender;
            stud.City__c = city;
            stud.Father_Name__c	 = fatherName;
            stud.Telugu__c	 = teluguMarks;
            stud.Hindi__c	 = hindiMarks;  
            stud.Maths__c = mathsMarks;
            stud.Social__c = socialMarks;
            stud.English__c = englishMarks;          
            insert stud;
            System.debug('@@@@@@ Student record created @@@@ '+stud);
        }catch(Exception e) {
            return false;
        }
        return true;
    }
}