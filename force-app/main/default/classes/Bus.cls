public class Bus {
    public String registrationNumber {get;set;}
    public String busModel {get;set;}
    public Person driver {get;set;}
    public Person conductor {get;set;}
    public String registrationDate {get;set;}
    public Integer busCapacity {get;set;}
    public Integer ticketPrice {get;set;}
    public List<Person> passengers {get;set;}
    public Bus() {
        passengers = new List<Person>();
    }
    public void addPassenger(Person p){
        passengers.add(p);
    }
    public Boolean isTicketAvaiable(){ 
        
        if(busCapacity > passengers.size() ) {
            return true;
        }
        return false;
    }
    public Integer getTotalTicketsPrice(){
        ticketPrice=100;
       return passengers.size()*ticketPrice;
    }
    public Integer getTotalMaleTicketsPrice(){
        integer sum = 100;
        for(Person ps : passengers){
            if(ps.gender == 'male'){
                sum = sum + ticketPrice;
            }
        }
          return sum;

    }
    public Integer getTotalMalePassengersCount(){
        for(Person ps : passengers){
            if(ps.gender == 'female'){
            }
        }
          return passengers.size();

    }
}