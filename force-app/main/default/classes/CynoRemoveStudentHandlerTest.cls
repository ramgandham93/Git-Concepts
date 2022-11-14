@IsTest
private class CynoRemoveStudentHandlerTest {
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
        CynoName stud3Name = new CynoName('Ramu', 'Gandham' , 'SpiderMan');
        ramuStudent.nameDetails = stud3Name;

        CynoStudent afridStudent = new CynoStudent();
        CynoName stud4Name = new CynoName('Afrid', 'Shiak', 'Sk');
        afridStudent.nameDetails = stud4Name;

        handler.addStudent(irfanStudent);
        handler.addStudent(kaniStudent);
        handler.addStudent(ramuStudent);
        handler.addStudent(afridStudent);

        System.debug('@@@@@ 29 @@@@@@ '+JSON.serialize(handler.studentsSet));
        System.assertEquals(4, handler.studentsSet.size());
        System.debug('@@@@@ 29 @@@@@@ '+JSON.serialize(handler.studentsSet));
        handler.removeStudent(irfanStudent);
        System.debug('@@@ 32 @@@'+JSON.serialize(handler.studentsSet));
        System.assertEquals(3, handler.studentsSet.size());
    }
}