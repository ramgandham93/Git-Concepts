public with sharing class CynoStudentAdmisionsHandler {
    public Set<CynoStudent> studentsSet {get;set;}
    public CynoStudentAdmisionsHandler() {
        this.studentsSet = new Set<CynoStudent>();
    }
    public void addStudent(CynoStudent student) {
        this.studentsSet.add(student);
    }
    public void removeStudent(CynoStudent student) {
        this.studentsSet.remove(student);   
    }
    public Integer getStudentCount() {
        return studentsSet.size();
    }
    public  Integer getWorkingMothersCount()  {
        Integer count=0;
        for(CynoStudent stud: studentsSet){
            if(stud.mother.occupation=='Govt'||stud.mother.occupation=='Private'||stud.mother.occupation=='private'){
                count=count+1;
            }
        }
        return count;
    }
    public Integer getWorkingFathersCount() {
        Integer count=0;
        for(CynoStudent stud: studentsSet){
            if(stud.father.occupation=='Govt'||stud.father.occupation=='Private'||stud.father.occupation=='private'){
                count=count+1;
            }
        }
        return count;
    }
    public Decimal getTotalParentsSalaryOfStudent(CynoStudent student) {
        Decimal Total=0;
        Total=student.father.yearSalary+student.mother.yearSalary;
        return Total;
    }
    /* public Integer getStudentCountLessThanSalary(Decimal salaryThreshold) {
return 0;
}
public Integer getHowManyStudentsShouldGetDiscountOnParentsSalary(Decimal salaryThreshold) {
return 0;
} */
    public List <String> motherSalaryMoreThanFathersSalary (){
        List <String> motherDetails = new List<String>();
        for(CynoStudent stud: studentsSet){
            if(stud.mother.yearSalary>stud.father.yearSalary){
                motherDetails.add(stud.nameDetails.firstName);
            }
        }
        return motherDetails;
    }
    public List <String> fatherSalaryMoreThanMothersSalary(){
        List <String> fatherDetails = new List<String>();
        for(CynoStudent stud: studentsSet){
            if(stud.mother.yearSalary<stud.father.yearSalary){
                fatherDetails.add(stud.nameDetails.firstName);
            }
        }
        return fatherDetails;
    }
    public List <String> motherUnEmployeed(){
        List <String> students = new List<String>();
        for(CynoStudent stud: studentsSet){
            if(stud.mother.occupation!='Govt'&&stud.mother.occupation!='Private'){
                students.add(stud.nameDetails.firstName);
            }
        }
        return students;
    }
    public List <String> fatherUnEmployeed(){
        List <String> students = new List<String>();
        for(CynoStudent stud: studentsSet){
            if(stud.father.occupation!='Govt'&&stud.father.occupation!='Private'){
                students.add(stud.nameDetails.firstName);
            }
        }
        return students;
    }
    
    public List <String> permanentAddressDifferCurrentAddress(){
        List <String> students = new List<String>();
        for(CynoStudent stud: studentsSet){
            if((stud.permanentAddress.firstLineOfAddress!=stud.currentAddress.firstLineOfAddress)|| 
               (stud.permanentAddress.secondLineOfAddress!=stud.currentAddress.secondLineOfAddress)||
               (stud.permanentAddress.city!=stud.currentAddress.city)||
               (stud.permanentAddress.postCode!=stud.currentAddress.postCode)||
               (stud.permanentAddress.state!=stud.currentAddress.state)||
               (stud.permanentAddress.country!=stud.currentAddress.country)) {
                students.add(stud.nameDetails.firstName);
            }
        }
        return students;
    }
    
    public List <String> permanentAddressSameAsCurrentAddress(){
        List <String> students = new List<String>();
        for(CynoStudent stud: studentsSet){
            if((stud.permanentAddress.firstLineOfAddress==stud.currentAddress.firstLineOfAddress)&& 
               (stud.permanentAddress.secondLineOfAddress==stud.currentAddress.secondLineOfAddress)&&
               (stud.permanentAddress.city==stud.currentAddress.city)&&
               (stud.permanentAddress.postCode==stud.currentAddress.postCode)&&
               (stud.permanentAddress.state==stud.currentAddress.state)&&
               (stud.permanentAddress.country==stud.currentAddress.country)) {
                students.add(stud.nameDetails.firstName);
            }
        }
        return students;
    }
    
    public List <String> bothParentsUnEmployeed(){
        List <String> students = new List<String>();
        for(CynoStudent stud: studentsSet){
            if((stud.mother.occupation!='Govt'&&stud.father.occupation!='Govt')&&(stud.father.occupation!='Private'&&stud.mother.occupation!='Private')){
                students.add(stud.nameDetails.firstName);
            }
        }
        return students;
    }
    
    public List <String> anyParentUnEmployeed(){
        List <String> students = new List<String>();
        for(CynoStudent stud: studentsSet){
            if((stud.mother.occupation!='Govt'&&stud.mother.occupation!='Private')||(stud.father.occupation!='Govt'&&stud.father.occupation!='Private')){
                students.add(stud.nameDetails.firstName);
            }
        }
        return students;
    }
    
    public List <String> bothParentsEmployeed(){
        List <String> students = new List<String>();
        for(CynoStudent stud: studentsSet){
            if((stud.mother.occupation=='Govt'||stud.mother.occupation=='Private')&&(stud.father.occupation=='Govt'||stud.father.occupation=='Private')){
                students.add(stud.nameDetails.firstName);
            }
        }
        return students;
    }
    
    public List <String> removeStudentsNoBillingAddress(){
        List <String> students = new List<String>();
        for(CynoStudent stud: studentsSet){
            if((stud.permanentAddress!=Null)&&(stud.currentAddress!=Null))
                students.add(stud.nameDetails.firstName);    
        }
        return students;
    }
    
    public List <String> removeStudentsNoCurrentAddress(){
        List <String> students = new List<String>();
        for(CynoStudent stud: studentsSet){
            if(stud.currentAddress!=Null)
                students.add(stud.nameDetails.firstName);    
        }
        return students;
    }
    
    public List <String> removeParentsBothUnEmployeed(){
        List <String> students = new List<String>();
        for(CynoStudent stud: studentsSet){
            if((stud.mother.occupation!='Govt'&&stud.father.occupation!='Govt')&&(stud.father.occupation!='Private'&&stud.mother.occupation!='Private')){
                
            }
            else{
                students.add(stud.nameDetails.firstName);
            }
        }
        return students;
    }
}