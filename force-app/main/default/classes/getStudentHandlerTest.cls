@IsTest
private class getStudentHandlerTest {
    @IsTest
     static void testDefaultConstructor() {
        CynoStudentAdmisionsHandler handler = new CynoStudentAdmisionsHandler();
        System.assertEquals(true, handler.studentsSet != NULL);
        System.assertEquals(0, handler.studentsSet.size());
    
    }
    @IsTest
    static void testAddStudent() {
       

        CynoStudent MuraliStudent = new CynoStudent();
        CynoName stud1Name = new CynoName('Murali', 'Sunkara', 'Krishna');
        MuraliStudent.nameDetails = stud1Name;
        CynoAddress std1perAddress=new CynoAddress('Opp SBI Bank','Main Road','Ongole',534252,'Kadapa','India');
        MuraliStudent.permanentAddress=std1perAddress;
        CynoAddress std1curAddress=new CynoAddress('KPHB','Kukatpally','Hyderabad',500032,'Telangana','India');
        MuraliStudent.CurrentAddress=std1curAddress;
        CynoParent std1father=new CynoParent('male','father',100000,'Private');
        MuraliStudent.father=std1father;
        CynoName std1fname=new CynoName('Narayana','Sunkara','Rao');
        MuraliStudent.father.nameDetails=std1fname;
        CynoParent std1Mother=new CynoParent('Female','Mother',125000,'Housewife');
        MuraliStudent.mother=std1Mother;
        CynoName std1mname=new CynoName('Satya','Sunkara','Veni');
        MuraliStudent.mother.nameDetails=std1mname;



        CynoStudent SrinivasStudent = new CynoStudent();
        CynoName stud2Name = new CynoName ('Srinivas', 'Mummidi', 'Rao');
        SrinivasStudent.nameDetails = stud2Name;
        CynoAddress std2perAddress=new CynoAddress('Near Busstand','Opp Postoffice','Bhimavaram',534201,'Andhra Pradesh','India');
        SrinivasStudent.permanentAddress=std2perAddress;
        CynoAddress std2curAddress=new CynoAddress('Opp CBI Office','Saravan Road','Kakinada',533005,'Andhra Pradesh','India');
        SrinivasStudent.CurrentAddress=std2curAddress;
        CynoParent std2father=new CynoParent('male','father',35000,'Govt');
        SrinivasStudent.father=std2father;
        CynoName std2fname=new CynoName('Arun','Mummidi','Kumar');
        SrinivasStudent.father.nameDetails=std2fname;
        CynoParent std2Mother=new CynoParent('Female','Mother',50000,'Govt');
        SrinivasStudent.mother=std2Mother;
        CynoName std2mname=new CynoName('Sudha','Mummidi','Rani');
        SrinivasStudent.mother.nameDetails=std2mname;

        CynoStudent EswarStudent = new CynoStudent();
        CynoName stud3Name = new CynoName('Eswar', 'Koruprolu' , 'Pavan');
        EswarStudent.nameDetails = stud3Name;
         CynoAddress std3perAddress=new CynoAddress('Menthe Vari Thota','Old Busstand','Eluru',562565,'Andhra Pradesh','India');
         EswarStudent.permanentAddress=std3perAddress;
        CynoAddress std3curAddress=new CynoAddress('Kumar Nivas','Main Road','Gudivada',521301,'Andhra Pradesh','India');
        EswarStudent.CurrentAddress=std3curAddress;
        CynoParent std3father=new CynoParent('male','father',1750000,'Private');
        EswarStudent.father=std3father;
        CynoName std3fname=new CynoName('Nageswar','Koruprolu','Rao');
        EswarStudent.father.nameDetails=std3fname;
        CynoParent std3Mother=new CynoParent('Female','Mother',75000,'Private');
        EswarStudent.mother=std3Mother;
        CynoName std3mname=new CynoName('Lakshmi','Koruprolu','Parvathi');
        EswarStudent.mother.nameDetails=std3mname;

       CynoStudentAdmisionsHandler handler = new CynoStudentAdmisionsHandler();
        handler.addStudent(MuraliStudent);
        
        handler.addStudent(SrinivasStudent);
        
        handler.addStudent(EswarStudent);
        handler.motherSalaryMoreThanFathersSalary(MuraliStudent);
        handler.motherSalaryMoreThanFathersSalary(SrinivasStudent);
        handler.motherSalaryMoreThanFathersSalary(EswarStudent);
        handler.fatherSalaryMoreThanMothersSalary(MuraliStudent);
        handler.fatherSalaryMoreThanMothersSalary(SrinivasStudent);
        handler.fatherSalaryMoreThanMothersSalary(EswarStudent);

        System.debug('@@@@@ 29 @@@@@@ '+JSON.serialize(handler.studentsSet));
        System.assertEquals(3, handler.studentsSet.size());
    }
    @IsTest
    static void getTotalSalaryOfMother() {
        CynoStudent student1 = new CynoStudent();
        CynoStudent student2 = new CynoStudent();
        CynoStudent student3 = new CynoStudent();

        CynoParent stud1Mother = new CynoParent('Female', 'Mother', 25000, 'Private');
        CynoParent stud2Mother = new CynoParent('Female', 'Mother', 50000, 'Govt');
        CynoParent stud3Mother = new CynoParent('Female', 'Mother', 75000, 'Private');
        
        student1.Mother = stud1mother;
        student2.Mother = stud2mother;
        student3.Mother = stud3mother;

        CynoStudentAdmisionsHandler handler = new CynoStudentAdmisionsHandler();
        handler.addStudent(student1);
        handler.addStudent(student2);
        handler.addStudent(student3);
        System.debug('@@@23@@@'+JSON.serialize(handler.studentsSet));
        Integer totalSalaryOfMother = handler.getTotalSalaryOfMothers();
        System.assertEquals(150000,totalSalaryOfMother);
    }
}