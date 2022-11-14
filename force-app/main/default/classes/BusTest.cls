@IsTest
public class BusTest {
    testMethod static void testIsTicketAvailable() {
        Bus b = new Bus();
        b.busCapacity = 30;
        System.assertEquals(true, b.isTicketAvaiable());
        
        Person p1 = new Person();
        p1.firstName = 'ramu';
        p1.gender = 'male';
        b.addPassenger(p1);
        
       
        Person p2 = new Person();
        p2.firstName = 'ramu1';
        p2.gender = 'male';
        b.addPassenger(p2);
        
        Person p3 = new Person();
        p3.firstName = 'ramya';
        p3.gender = 'female';
        b.addPassenger(p3);
        
        Person p4 = new Person();
        p4.firstName = 'ramya1';
        p4.gender = 'female';
        b.addPassenger(p4);
        
        Person p5 = new Person();
        p5.firstName = 'ramesh';
        p5.gender = 'male';
        b.addPassenger(p5);
        
        System.assertEquals(true, b.isTicketAvaiable());
        
    }
    
    testMethod static void getTotalTicketPrice() {
        Bus b = new Bus();
        b.busCapacity = 30;
        
        Person p1 = new Person();
        p1.firstName = 'ramu';
        p1.gender = 'male';
        b.addPassenger(p1);
        
       
        Person p2 = new Person();
        p2.firstName = 'ramu1';
        p2.gender = 'male';
        b.addPassenger(p2);
        
        system.assertEquals(206, b.getTotalTicketsPrice());
        
    }   
    testMethod static void getTotalMaleTicketsPrice() {
        Bus b = new Bus();
        b.busCapacity = 30;
        b.ticketPrice = 140;
        
        Person p1 = new Person();
        p1.firstName = 'ramu';
        p1.gender = 'male';
        b.addPassenger(p1);
        
       
        Person p2 = new Person();
        p2.firstName = 'ramu1';
        p2.gender = 'male';
        b.addPassenger(p2);
        
        Person p3 = new Person();
        p3.firstName = 'ramya';
        p3.gender = 'female';
        b.addPassenger(p3);
        
        Person p4 = new Person();
        p4.firstName = 'ramya1';
        p4.gender = 'female';
        b.addPassenger(p4);
        
        Person p5 = new Person();
        p5.firstName = 'ramesh';
        p5.gender = 'male';
        b.addPassenger(p5);
        
        system.assertEquals(10, b.getTotalMaleTicketsPrice());
        
    }
    testMethod static void getTotalMalePassengersCount() {
        Bus b = new Bus();
        b.busCapacity = 30;
        b.ticketPrice = 140;
        
        Person p1 = new Person();
        p1.firstName = 'ramu';
        p1.gender = 'male';
        b.addPassenger(p1);
        
       
        Person p2 = new Person();
        p2.firstName = 'ramu1';
        p2.gender = 'male';
        b.addPassenger(p2);
        
        Person p3 = new Person();
        p3.firstName = 'ramya';
        p3.gender = 'female';
        b.addPassenger(p3);
        
        Person p4 = new Person();
        p4.firstName = 'ramya1';
        p4.gender = 'female';
        b.addPassenger(p4);
        
        Person p5 = new Person();
        p5.firstName = 'ramesh';
        p5.gender = 'male';
        b.addPassenger(p5);
        
        system.assertEquals(2, b.getTotalMalePassengersCount());
        
    }
}