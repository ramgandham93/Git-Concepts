@IsTest
private class CynoStudentAdmisionsHandlerTest {
    @IsTest
    static void testDefaultConstructor() {
        CynoStudentAdmisionsHandler handler = new CynoStudentAdmisionsHandler();
        System.assertEquals(true, handler.studentsSet != NULL);
        System.assertEquals(0, handler.studentsSet.size());
    }
    @IsTest
    static void testAddStudent() {
        CynoStudentAdmisionsHandler handler = new CynoStudentAdmisionsHandler();
        
        CynoStudent irfanStudent = new CynoStudent();
        CynoName stud1Name = new CynoName('Irfan', 'Sheik', '');
        irfanStudent.nameDetails = stud1Name;
        
        CynoStudent kaniStudent = new CynoStudent();
        CynoName stud2Name = new CynoName('Kani', 'Chandrashekharan', '');
        kaniStudent.nameDetails = stud2Name;
        
        CynoStudent ramuStudent = new CynoStudent();
        CynoName stud3Name = new CynoName('Rami', 'Gandham' , 'SpiderMan');
        ramuStudent.nameDetails = stud3Name;
        
        handler.addStudent(irfanStudent);
        handler.addStudent(kaniStudent);
        handler.addStudent(ramuStudent);
        
        System.debug('@@@@@ 1 @@@@@@ '+JSON.serialize(handler.studentsSet));
        System.assertEquals(3, handler.studentsSet.size());
    }
    @IsTest
    static void testRemoveStudent() {
        CynoStudentAdmisionsHandler handler = new CynoStudentAdmisionsHandler();
        CynoStudent irfanStudent = new CynoStudent();
        CynoName stud1Name = new CynoName('Irfan', 'Sheik', '');
        irfanStudent.nameDetails = stud1Name;
        
        CynoStudent kaniStudent = new CynoStudent();
        CynoName stud2Name = new CynoName('Kani', 'Chandrashekharan', '');
        kaniStudent.nameDetails = stud2Name;
        
        CynoStudent ramuStudent = new CynoStudent();
        CynoName stud3Name = new CynoName('Ramu', 'Gandham' , 'SpiderMan');
        ramuStudent.nameDetails = stud3Name;
        
        CynoStudent afridStudent = new CynoStudent();
        CynoName stud4Name = new CynoName('Afrid', 'Shiak', 'Sk');
        afridStudent.nameDetails = stud4Name;
        
        handler.addStudent(irfanStudent);
        handler.addStudent(kaniStudent);
        handler.addStudent(ramuStudent);
        handler.addStudent(afridStudent);
        
        System.debug('@@@@@ 2 @@@@@@ '+JSON.serialize(handler.studentsSet));
        System.assertEquals(4, handler.studentsSet.size());
        
        handler.removeStudent(irfanStudent);
        
        System.debug('@@@ 3 @@@'+JSON.serialize(handler.studentsSet));
        System.assertEquals(3, handler.studentsSet.size());
    }
    @IsTest
    static void testStudentCount() {
        Integer count=0;
        CynoStudentAdmisionsHandler handler = new CynoStudentAdmisionsHandler();        
        CynoStudent irfanStudent = new CynoStudent();
        CynoName stud1Name = new CynoName('Irfan', 'Sheik', '');
        irfanStudent.nameDetails = stud1Name;
        
        CynoStudent kaniStudent = new CynoStudent();
        CynoName stud2Name = new CynoName('Kani', 'Chandrashekharan', '');
        kaniStudent.nameDetails = stud2Name;
        
        handler.addStudent(irfanStudent);
        handler.addStudent(kaniStudent);
        
        count = handler.getStudentCount();
        
        System.assertEquals(2, count);
        System.debug('@@@ 4 @@@'+JSON.serialize(handler.studentsSet));
        System.debug('@@@ Displaying Count @@@'+(handler.getStudentCount())); 
    }
    @IsTest
    static void testWorkingMothersCount() {
        Integer count=0;
        CynoStudent MuraliStudent = new CynoStudent();
        CynoName stud1Name = new CynoName('Murali', 'Sunkara', 'Krishna');
        MuraliStudent.nameDetails = stud1Name;
        CynoParent std1Mother=new CynoParent('Female','Mother',125000,'Govt');
        MuraliStudent.mother=std1Mother;
        CynoName std1mname=new CynoName('Satya','Sunkara','Veni');
        MuraliStudent.mother.nameDetails=std1mname;
        
        CynoStudent SrinivasStudent = new CynoStudent();
        CynoName stud2Name = new CynoName ('Srinivas', 'Mummidi', 'Rao');
        SrinivasStudent.nameDetails = stud2Name;
        CynoParent std2Mother=new CynoParent('Female','Mother',50000,'Govt');
        SrinivasStudent.mother=std2Mother;
        CynoName std2mname=new CynoName('Sudha','Mummidi','Rani');
        SrinivasStudent.mother.nameDetails=std2mname;
        
        CynoStudent EswarStudent = new CynoStudent();
        CynoName stud3Name = new CynoName('Eswar', 'Koruprolu' , 'Pavan');
        EswarStudent.nameDetails = stud3Name;
        CynoParent std3Mother=new CynoParent('Female','Mother',75000,'Private');
        EswarStudent.mother=std3Mother;
        CynoName std3mname=new CynoName('Lakshmi','Koruprolu','Parvathi');
        EswarStudent.mother.nameDetails=std3mname;
        
        CynoStudentAdmisionsHandler handler = new CynoStudentAdmisionsHandler();
        handler.addStudent(MuraliStudent);
        handler.addStudent(SrinivasStudent);
        handler.addStudent(EswarStudent);
        
        count= handler.getWorkingMothersCount();
        System.assertEquals(3, count);
        System.debug('@@@ 5 @@@'+JSON.serialize(handler.studentsSet));
        System.debug('@@@ Displaying Count @@@'+(handler.getWorkingMothersCount()));
    }
    @IsTest
    static void testWorkingFathersCount() {
        Integer count=0;
        CynoStudent MuraliStudent = new CynoStudent();
        CynoName stud1Name = new CynoName('Murali', 'Sunkara', 'Krishna');
        MuraliStudent.nameDetails = stud1Name;
        CynoParent std1father=new CynoParent('male','father',100000,'Private');
        MuraliStudent.father=std1father;
        CynoName std1fname=new CynoName('Narayana','Sunkara','Rao');
        MuraliStudent.father.nameDetails=std1fname;
        
        CynoStudent SrinivasStudent = new CynoStudent();
        CynoName stud2Name = new CynoName ('Srinivas', 'Mummidi', 'Rao');
        SrinivasStudent.nameDetails = stud2Name;
        CynoParent std2father=new CynoParent('male','father',35000,'Gov');
        SrinivasStudent.father=std2father;
        CynoName std2fname=new CynoName('Arun','Mummidi','Kumar');
        SrinivasStudent.father.nameDetails=std2fname;
        
        CynoStudentAdmisionsHandler handler = new CynoStudentAdmisionsHandler();
        handler.addStudent(MuraliStudent);
        handler.addStudent(SrinivasStudent);
        
        count= handler.getWorkingFathersCount();
        System.assertEquals(1, count);
        
        System.debug('@@@ 6 @@@'+JSON.serialize(handler.studentsSet));
        System.debug('@@@ Displaying Count @@@'+(handler.getWorkingFathersCount()));
    }
    @IsTest
    static void testParentsTotalSalary(){
        Decimal count=0;
        CynoStudentAdmisionsHandler handler = new CynoStudentAdmisionsHandler();
        CynoStudent MuraliStudent = new CynoStudent();
        CynoName stud1Name = new CynoName('Murali', 'Sunkara', 'Krishna');
        MuraliStudent.nameDetails = stud1Name;
        CynoParent std1Mother=new CynoParent('Female','Mother',125000,'Govt');
        MuraliStudent.mother=std1Mother;
        CynoName std1mname=new CynoName('Satya','Sunkara','Veni');
        MuraliStudent.mother.nameDetails=std1mname;
        CynoParent std1father=new CynoParent('male','father',100000,'Private');
        MuraliStudent.father=std1father;
        CynoName std1fname=new CynoName('Narayana','Sunkara','Rao');
        MuraliStudent.father.nameDetails=std1fname;
        
        CynoStudent SrinivasStudent = new CynoStudent();
        CynoName stud2Name = new CynoName ('Srinivas', 'Mummidi', 'Rao');
        SrinivasStudent.nameDetails = stud2Name;
        CynoParent std2Mother=new CynoParent('Female','Mother',50000,'Govt');
        SrinivasStudent.mother=std2Mother;
        CynoName std2mname=new CynoName('Sudha','Mummidi','Rani');
        SrinivasStudent.mother.nameDetails=std2mname;
        CynoParent std2father=new CynoParent('male','father',35000,'Gov');
        SrinivasStudent.father=std2father;
        CynoName std2fname=new CynoName('Arun','Mummidi','Kumar');
        SrinivasStudent.father.nameDetails=std2fname;
        
        handler.addStudent(MuraliStudent);
        handler.addStudent(SrinivasStudent);
        
        count = handler.getTotalParentsSalaryOfStudent(MuraliStudent);
        System.assertEquals(225000, count);
        System.debug('@@@ 7 @@@'+(handler.getTotalParentsSalaryOfStudent(MuraliStudent)));
        
    }
    @IsTest
    static void testMothersSalaryGreaterToFathers(){
        List<String> result = new List<String>();
        CynoStudentAdmisionsHandler handler = new CynoStudentAdmisionsHandler();
        CynoStudent MuraliStudent = new CynoStudent();
        CynoName stud1Name = new CynoName('Murali', 'Sunkara', 'Krishna');
        MuraliStudent.nameDetails = stud1Name;
        CynoParent std1Mother=new CynoParent('Female','Mother',125000,'Govt');
        MuraliStudent.mother=std1Mother;
        CynoName std1mname=new CynoName('Satya','Sunkara','Veni');
        MuraliStudent.mother.nameDetails=std1mname;
        CynoParent std1father=new CynoParent('male','father',100000,'Private');
        MuraliStudent.father=std1father;
        CynoName std1fname=new CynoName('Narayana','Sunkara','Rao');
        MuraliStudent.father.nameDetails=std1fname;
        
        CynoStudent SrinivasStudent = new CynoStudent();
        CynoName stud2Name = new CynoName ('Srinivas', 'Mummidi', 'Rao');
        SrinivasStudent.nameDetails = stud2Name;
        CynoParent std2Mother=new CynoParent('Female','Mother',500,'Govt');
        SrinivasStudent.mother=std2Mother;
        CynoName std2mname=new CynoName('Sudha','Mummidi','Rani');
        SrinivasStudent.mother.nameDetails=std2mname;
        CynoParent std2father=new CynoParent('male','father',35000,'Gov');
        SrinivasStudent.father=std2father;
        CynoName std2fname=new CynoName('Arun','Mummidi','Kumar');
        SrinivasStudent.father.nameDetails=std2fname;
        
        handler.addStudent(MuraliStudent);
        handler.addStudent(SrinivasStudent);
        
        result = handler.motherSalaryMoreThanFathersSalary();
        System.assertEquals(1,result.size());
        System.debug('@@@ 8 @@@'+(handler.motherSalaryMoreThanFathersSalary())); 
    }
    
    @IsTest
    static void testFatherSalaryGreaterToMother(){
        List<String> result = new List<String>();
        CynoStudentAdmisionsHandler handler = new CynoStudentAdmisionsHandler();
        CynoStudent MuraliStudent = new CynoStudent();
        CynoName stud1Name = new CynoName('Murali', 'Sunkara', 'Krishna');
        MuraliStudent.nameDetails = stud1Name;
        CynoParent std1Mother=new CynoParent('Female','Mother',125000,'Govt');
        MuraliStudent.mother=std1Mother;
        CynoName std1mname=new CynoName('Satya','Sunkara','Veni');
        MuraliStudent.mother.nameDetails=std1mname;
        CynoParent std1father=new CynoParent('male','father',100000,'Private');
        MuraliStudent.father=std1father;
        CynoName std1fname=new CynoName('Narayana','Sunkara','Rao');
        MuraliStudent.father.nameDetails=std1fname;
        
        CynoStudent SrinivasStudent = new CynoStudent();
        CynoName stud2Name = new CynoName ('Srinivas', 'Mummidi', 'Rao');
        SrinivasStudent.nameDetails = stud2Name;
        CynoParent std2Mother=new CynoParent('Female','Mother',500,'Govt');
        SrinivasStudent.mother=std2Mother;
        CynoName std2mname=new CynoName('Sudha','Mummidi','Rani');
        SrinivasStudent.mother.nameDetails=std2mname;
        CynoParent std2father=new CynoParent('male','father',35000,'Gov');
        SrinivasStudent.father=std2father;
        CynoName std2fname=new CynoName('Arun','Mummidi','Kumar');
        SrinivasStudent.father.nameDetails=std2fname;
        
        handler.addStudent(MuraliStudent);
        handler.addStudent(SrinivasStudent);
        
        result = handler.fatherSalaryMoreThanMothersSalary();
        System.assertEquals(1,result.size());
        System.debug('@@@ 9 @@@'+(handler.fatherSalaryMoreThanMothersSalary())); 
    }
    
    @IsTest
    static void testmotherUnEmployeed(){
        List<String> result = new List<String>();
        CynoStudentAdmisionsHandler handler = new CynoStudentAdmisionsHandler();
        CynoStudent MuraliStudent = new CynoStudent();
        CynoName stud1Name = new CynoName('Murali', 'Sunkara', 'Krishna');
        MuraliStudent.nameDetails = stud1Name;
        CynoParent std1Mother=new CynoParent('Female','Mother',125000,'Govt');
        MuraliStudent.mother=std1Mother;
        CynoName std1mname=new CynoName('Satya','Sunkara','Veni');
        MuraliStudent.mother.nameDetails=std1mname;
        
        CynoStudent SrinivasStudent = new CynoStudent();
        CynoName stud2Name = new CynoName ('Srinivas', 'Mummidi', 'Rao');
        SrinivasStudent.nameDetails = stud2Name;
        CynoParent std2Mother=new CynoParent('Female','Mother',500,'Priva');
        SrinivasStudent.mother=std2Mother;
        CynoName std2mname=new CynoName('Sudha','Mummidi','Rani');
        SrinivasStudent.mother.nameDetails=std2mname;
        
        
        handler.addStudent(MuraliStudent);
        handler.addStudent(SrinivasStudent);
        
        result = handler.motherUnEmployeed();
        System.assertEquals(1,result.size());
        System.debug('@@@ 10 @@@'+(handler.motherUnEmployeed()));   
    }
    
    @IsTest
    static void testFatherUnEmployeed(){
        List<String> result = new List<String>();
        CynoStudentAdmisionsHandler handler = new CynoStudentAdmisionsHandler();
        CynoStudent MuraliStudent = new CynoStudent();
        CynoName stud1Name = new CynoName('Murali', 'Sunkara', 'Krishna');
        MuraliStudent.nameDetails = stud1Name;
        CynoParent std1father=new CynoParent('male','father',100000,'Private');
        MuraliStudent.father=std1father;
        CynoName std1fname=new CynoName('Narayana','Sunkara','Rao');
        MuraliStudent.father.nameDetails=std1fname;
        
        CynoStudent SrinivasStudent = new CynoStudent();
        CynoName stud2Name = new CynoName ('Srinivas', 'Mummidi', 'Rao');
        SrinivasStudent.nameDetails = stud2Name;
        CynoParent std2father=new CynoParent('male','father',35000,'Gov');
        SrinivasStudent.father=std2father;
        CynoName std2fname=new CynoName('Arun','Mummidi','Kumar');
        SrinivasStudent.father.nameDetails=std2fname;
        
        
        handler.addStudent(MuraliStudent);
        handler.addStudent(SrinivasStudent);
        
        result = handler.fatherUnEmployeed();
        System.assertEquals(1,result.size());
        System.debug('@@@ 11 @@@'+(handler.fatherUnEmployeed()));     
    }
    
    @IsTest
    static void testPermanentAddressDifferCurrentAddress(){
        List<String> result = new List<String>();
        CynoStudentAdmisionsHandler handler = new CynoStudentAdmisionsHandler();
        CynoStudent MuraliStudent = new CynoStudent();
        CynoName stud1Name = new CynoName('Murali', 'Sunkara', 'Krishna');
        MuraliStudent.nameDetails = stud1Name;
        CynoAddress currAddress = new CynoAddress('Hanuman Junction','SBI','Bvrm','534201','AP','India');
        MuraliStudent.currentAddress=currAddress;
        CynoAddress permaAddress = new CynoAddress('Ram Nagar','SBI','Bvrm','534201','AP','India');
        MuraliStudent.permanentAddress=permaAddress;
        
        handler.addStudent(MuraliStudent);
        //System.debug('@@@ Sample Testing currentAddress@@@'+(currAddress));
        //System.debug('@@@ Sample Testing permanentAddress@@@'+(permaAddress));
        //System.debug('@@@ Size Testing currentAddress@@@'+(currAddress[0]));
        //System.debug('@@@ Size Testing permanentAddress@@@'+(permaAddress[0]));
        
        //System.debug('@@@ Sample Testing Both@@@'+(permaAddress[0].equals(currAddress[0])));
        // System.debug('@@@ Sample Testing@@@'+(MuraliStudent));
        
        result = handler.permanentAddressDifferCurrentAddress();
        System.assertEquals(1,result.size());
        System.debug('@@@ 12 @@@'+(handler.permanentAddressDifferCurrentAddress()));   
        
    }
    
    @IsTest
    static void testPermanentAddressSameAsCurrentAddress(){
        List<String> result = new List<String>();
        CynoStudentAdmisionsHandler handler = new CynoStudentAdmisionsHandler();
        CynoStudent MuraliStudent = new CynoStudent();
        CynoName stud1Name = new CynoName('Murali', 'Sunkara', 'Krishna');
        MuraliStudent.nameDetails = stud1Name;
        CynoAddress currAddress = new CynoAddress('Ram Nagar','SBI','Bvrm','534201','AP','India');
        MuraliStudent.currentAddress=currAddress;
        CynoAddress permaAddress = new CynoAddress('Ram Nagar','SBI','Bvrm','534201','AP','India');
        MuraliStudent.permanentAddress=permaAddress;
        
        handler.addStudent(MuraliStudent);
        result = handler.permanentAddressSameAsCurrentAddress();
        System.assertEquals(1,result.size());
        System.debug('@@@ 12 @@@'+(handler.permanentAddressSameAsCurrentAddress())); 
    }
    
    @IsTest
    static void testBothParentsUnEmployeed(){
        List<String> result = new List<String>();
        CynoStudentAdmisionsHandler handler = new CynoStudentAdmisionsHandler();
        
        CynoStudent MuraliStudent = new CynoStudent();
        CynoName stud1Name = new CynoName('Murali', 'Sunkara', 'Krishna');
        MuraliStudent.nameDetails = stud1Name;
        CynoParent std1father=new CynoParent('male','father',100000,'Private');
        MuraliStudent.father=std1father;
        CynoName std1fname=new CynoName('Narayana','Sunkara','Rao');
        MuraliStudent.father.nameDetails=std1fname;
        CynoParent std1Mother=new CynoParent('Female','Mother',125000,'Govt');
        MuraliStudent.mother=std1Mother;
        CynoName std1mname=new CynoName('Satya','Sunkara','Veni');
        MuraliStudent.mother.nameDetails=std1mname;
        
        CynoStudent SrinivasStudent = new CynoStudent();
        CynoName stud2Name = new CynoName ('Srinivas', 'Mummidi', 'Rao');
        SrinivasStudent.nameDetails = stud2Name;
        CynoParent std2father=new CynoParent('male','father',35000,'Gov');
        SrinivasStudent.father=std2father;
        CynoName std2fname=new CynoName('Arun','Mummidi','Kumar');
        SrinivasStudent.father.nameDetails=std2fname;
        CynoParent std2Mother=new CynoParent('Female','Mother',500,'Priva');
        SrinivasStudent.mother=std2Mother;
        CynoName std2mname=new CynoName('Sudha','Mummidi','Rani');
        SrinivasStudent.mother.nameDetails=std2mname;
        
        
        handler.addStudent(MuraliStudent);
        handler.addStudent(SrinivasStudent);
        
        result = handler.bothParentsUnEmployeed();
        System.assertEquals(1,result.size());
        System.debug('@@@ 11 @@@'+(handler.bothParentsUnEmployeed()));
    }
    
    @IsTest
    static void testAnyParentUnEmployeed(){
        List<String> result = new List<String>();
        CynoStudentAdmisionsHandler handler = new CynoStudentAdmisionsHandler();
        
        CynoStudent MuraliStudent = new CynoStudent();
        CynoName stud1Name = new CynoName('Murali', 'Sunkara', 'Krishna');
        MuraliStudent.nameDetails = stud1Name;
        CynoParent std1father=new CynoParent('male','father',100000,'Private');
        MuraliStudent.father=std1father;
        CynoName std1fname=new CynoName('Narayana','Sunkara','Rao');
        MuraliStudent.father.nameDetails=std1fname;
        CynoParent std1Mother=new CynoParent('Female','Mother',125000,'Govt');
        MuraliStudent.mother=std1Mother;
        CynoName std1mname=new CynoName('Satya','Sunkara','Veni');
        MuraliStudent.mother.nameDetails=std1mname;
        
        CynoStudent SrinivasStudent = new CynoStudent();
        CynoName stud2Name = new CynoName ('Srinivas', 'Mummidi', 'Rao');
        SrinivasStudent.nameDetails = stud2Name;
        CynoParent std2father=new CynoParent('male','father',35000,'Gov');
        SrinivasStudent.father=std2father;
        CynoName std2fname=new CynoName('Arun','Mummidi','Kumar');
        SrinivasStudent.father.nameDetails=std2fname;
        CynoParent std2Mother=new CynoParent('Female','Mother',500,'Priva');
        SrinivasStudent.mother=std2Mother;
        CynoName std2mname=new CynoName('Sudha','Mummidi','Rani');
        SrinivasStudent.mother.nameDetails=std2mname;
        
        
        handler.addStudent(MuraliStudent);
        handler.addStudent(SrinivasStudent);
        
        result = handler.anyParentUnEmployeed();
        System.assertEquals(1,result.size());
        System.debug('@@@ 12 @@@'+(handler.anyParentUnEmployeed()));
    }
    
    @IsTest
    static void testBothParentsEmployeed(){
        List<String> result = new List<String>();
        CynoStudentAdmisionsHandler handler = new CynoStudentAdmisionsHandler();
        
        CynoStudent MuraliStudent = new CynoStudent();
        CynoName stud1Name = new CynoName('Murali', 'Sunkara', 'Krishna');
        MuraliStudent.nameDetails = stud1Name;
        CynoParent std1father=new CynoParent('male','father',100000,'Private');
        MuraliStudent.father=std1father;
        CynoName std1fname=new CynoName('Narayana','Sunkara','Rao');
        MuraliStudent.father.nameDetails=std1fname;
        CynoParent std1Mother=new CynoParent('Female','Mother',125000,'Govt');
        MuraliStudent.mother=std1Mother;
        CynoName std1mname=new CynoName('Satya','Sunkara','Veni');
        MuraliStudent.mother.nameDetails=std1mname;
        
        CynoStudent SrinivasStudent = new CynoStudent();
        CynoName stud2Name = new CynoName ('Srinivas', 'Mummidi', 'Rao');
        SrinivasStudent.nameDetails = stud2Name;
        CynoParent std2father=new CynoParent('male','father',35000,'Govt');
        SrinivasStudent.father=std2father;
        CynoName std2fname=new CynoName('Arun','Mummidi','Kumar');
        SrinivasStudent.father.nameDetails=std2fname;
        CynoParent std2Mother=new CynoParent('Female','Mother',500,'Pri');
        SrinivasStudent.mother=std2Mother;
        CynoName std2mname=new CynoName('Sudha','Mummidi','Rani');
        SrinivasStudent.mother.nameDetails=std2mname;
        
        
        handler.addStudent(MuraliStudent);
        handler.addStudent(SrinivasStudent);
        
        result = handler.bothParentsEmployeed();
        System.assertEquals(1,result.size());
        System.debug('@@@ 13 @@@'+(handler.bothParentsEmployeed()));
    }
    
    @IsTest
    static void testRemoveStudentsNoBillingAddress(){
        List<String> result = new List<String>();
        CynoStudentAdmisionsHandler handler = new CynoStudentAdmisionsHandler();
        CynoStudent MuraliStudent = new CynoStudent();
        CynoName stud1Name = new CynoName('Murali', 'Sunkara', 'Krishna');
        MuraliStudent.nameDetails = stud1Name;
        //CynoAddress currAddress = new CynoAddress('Ram Nagar','SBI','Bvrm','534201','AP','India');
        //MuraliStudent.currentAddress=currAddress;
        CynoAddress permaAddress = new CynoAddress('Ram Nagar','SBI','Bvrm','534201','AP','India');
        MuraliStudent.permanentAddress=permaAddress;
        
        
        
        handler.addStudent(MuraliStudent);
        
        result = handler.removeStudentsNoBillingAddress();
        System.assertEquals(0,result.size());
        System.debug('@@@ 14 @@@'+(handler.removeStudentsNoBillingAddress()));
    }
    
    @IsTest
    static void testRemoveStudentNoCurrentAddress(){
        List<String> result = new List<String>();
        CynoStudentAdmisionsHandler handler = new CynoStudentAdmisionsHandler();
        CynoStudent MuraliStudent = new CynoStudent();
        CynoName stud1Name = new CynoName('Murali', 'Sunkara', 'Krishna');
        MuraliStudent.nameDetails = stud1Name;
        CynoAddress currAddress = new CynoAddress('Ram Nagar','SBI','Bvrm','534201','AP','India');
        MuraliStudent.currentAddress=currAddress;
        
        handler.addStudent(MuraliStudent);
        
        result = handler.removeStudentsNoCurrentAddress();
        System.assertEquals(1,result.size());
        System.debug('@@@ 15 @@@'+(handler.removeStudentsNoCurrentAddress()));
    }
    
    @IsTest
    static void testRemoveParentsUnEmployeed(){
        List<String> result = new List<String>();
        CynoStudentAdmisionsHandler handler = new CynoStudentAdmisionsHandler();
        
        CynoStudent MuraliStudent = new CynoStudent();
        CynoName stud1Name = new CynoName('Murali', 'Sunkara', 'Krishna');
        MuraliStudent.nameDetails = stud1Name;
        CynoParent std1father=new CynoParent('male','father',100000,'Private');
        MuraliStudent.father=std1father;
        CynoName std1fname=new CynoName('Narayana','Sunkara','Rao');
        MuraliStudent.father.nameDetails=std1fname;
        CynoParent std1Mother=new CynoParent('Female','Mother',125000,'Govt');
        MuraliStudent.mother=std1Mother;
        CynoName std1mname=new CynoName('Satya','Sunkara','Veni');
        MuraliStudent.mother.nameDetails=std1mname;
        
        CynoStudent SrinivasStudent = new CynoStudent();
        CynoName stud2Name = new CynoName ('Srinivas', 'Mummidi', 'Rao');
        SrinivasStudent.nameDetails = stud2Name;
        CynoParent std2father=new CynoParent('male','father',35000,'Gov');
        SrinivasStudent.father=std2father;
        CynoName std2fname=new CynoName('Arun','Mummidi','Kumar');
        SrinivasStudent.father.nameDetails=std2fname;
        CynoParent std2Mother=new CynoParent('Female','Mother',500,'Priva');
        SrinivasStudent.mother=std2Mother;
        CynoName std2mname=new CynoName('Sudha','Mummidi','Rani');
        SrinivasStudent.mother.nameDetails=std2mname;
        
        
        handler.addStudent(MuraliStudent);
        handler.addStudent(SrinivasStudent);
        
        result = handler.removeParentsBothUnEmployeed();
        System.assertEquals(1,result.size());
        System.debug('@@@ 16 @@@'+(handler.removeParentsBothUnEmployeed()));
    }   
}