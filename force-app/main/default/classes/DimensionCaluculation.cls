public class DimensionCaluculation {
    public integer lenth{get;set;}
    public integer width{get;set;}
    
    public void  DimensionCaluculation(integer a, integer b){
        this.lenth = a;
        this.width = b;
    }
    public integer getarea(){
        return lenth*width;	
    }
    
    
}