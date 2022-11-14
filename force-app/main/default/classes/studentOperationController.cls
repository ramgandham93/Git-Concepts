public class studentOperationController {
    @AuraEnabled
    public static void addStudent(StudentWrapper student) {
        Student__c stud = new Student__c();
        stud.Name = student.Name;
        if(student.marksList != NULL) {
            for(Marks marks : student.marksList) {
                if(marks.subject != NULL &&
                   marks.subject.equalsIgnoreCase('English')) {
                       stud.English__c = marks.mark;
                   }
                if(marks.subject != NULL &&
                   marks.subject.equalsIgnoreCase('Maths')) {
                       stud.Maths__c = marks.mark;
                   }
                if(marks.subject != NULL &&
                   marks.subject.equalsIgnoreCase('Social')) {
                       stud.Social__c = marks.mark;
                   }
                if(marks.subject != NULL &&
                   marks.subject.equalsIgnoreCase('Hindi')) {
                       stud.Hindi__c = marks.mark;
                   }
                if(marks.subject != NULL &&
                   marks.subject.equalsIgnoreCase('Telugu')) {
                       stud.Telugu__c = marks.mark;
                   }
            }
        }
        insert stud;
    }
@AuraEnabled
    public static void addStudents(List<StudentWrapper> studentWrappers) {
        List<Student__c> stud1 = new List<Student__c>();
        if(!studentWrappers.isEmpty())
        {
            for(StudentWrapper stu: StudentWrappers)
            {
                if(stu.Name != null && !stu.marksList.isEmpty())
                {
                    Student__c stud = new Student__c() ;
                    stud.Name = stu.name;
                    for(Marks mar: stu.marksList)
                    {
                        if(mar.subject.equalsIgnoreCase('English'))
                        {
                            stud.English__c = mar.mark;
                        }
                        if(mar.subject.equalsIgnoreCase('Maths'))
                        {
                            stud.Maths__c = mar.mark;
                        }
                        if(mar.subject.equalsIgnoreCase('Social'))
                        {
                            stud.Social__c = mar.mark;
                        }
                        if(mar.subject.equalsIgnoreCase('Hindi'))
                        {
                            stud.Hindi__c = mar.mark;
                        }
                        if(mar.subject.equalsIgnoreCase('Telugu'))
                        {
                            stud.Telugu__c = mar.mark;
                        }
                        
                        stud1.add(stud);
                    }
                }
               
            }
        }
       insert stud1; 
    }
    
    /**public Class Marks {
        public String subject {get;set;}
        public Integer mark {get;set;}
        
        public Marks(String subject, Integer mark){
            this.subject = subject;
            this.mark = mark;
        }
    }*/
    
    public Class StudentWrapper {
        @AuraEnabled
        public String name {get;set;}
        @AuraEnabled
        public List<Marks> marksList {get;set;}
        
        public StudentWrapper(String nameParam, List<Marks> marksListParam) {
            this.name = nameParam;
            if(marksList == NULL) {
                marksList = new List<Marks>();
            }
            else {
                this.marksList = marksListParam;
            }
        }
        
        
    }
    
}