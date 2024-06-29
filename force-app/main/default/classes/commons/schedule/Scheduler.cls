public class Scheduler {
    
    CronTriggerRepository repository;

    public Scheduler() {
        repository = new CronTriggerRepository();
    }

    public void abort (String name) {

        List<CronTrigger> jobs = repository.findByName (name);

        for ( CronTrigger cron : jobs ) {
            
            System.abortJob(cron.Id);

        }

    }


}