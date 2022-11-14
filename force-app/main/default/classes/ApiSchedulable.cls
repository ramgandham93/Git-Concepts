public class ApiSchedulable implements Schedulable {
    
    public void execute(SchedulableContext sc){
        ApiBatch ab = new ApiBatch();
        dataBase.executeBatch(ab);
    }
}