public with sharing class CynoParent {
    public CynoName nameDetails {set;get;}
    public String gender;
    public String parentType; //Mother , Father or Guardian
    public Integer yearSalary;
    public String occupation;
    public CynoParent(String gender,string parentType,Integer yearSalary,String Occupation){
        this.gender=gender;
        this.parentType=parentType;
        this.yearSalary=yearSalary;
        this.Occupation=occupation;
    }
}