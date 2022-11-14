@IsTest
private class GetTotalSalaryOfMotherhandlerTest {
    @IsTest
    static void testDefaultConstructor() {
        CynoStudentAdmisionsHandler handler = new CynoStudentAdmisionsHandler();
        System.assertEquals(true, handler.studentsSet != NULL);
        System.assertEquals(0, handler.studentsSet.size());
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