public class PurgeLogBatch implements Database.Batchable<SObject> {
    
    LogRepository repository;

    public PurgeLogBatch() {
        this.repository = new LogRepository();
    }

    public Database.QueryLocator start(Database.BatchableContext context) {

        System.debug('PurgeLogBatch - start');

        return repository.findLogToPurge();
    }

    public void execute ( Database.BatchableContext context, List<Log__c> logs) {

        System.debug('PurgeLogBatch - execute');

        repository.remove(logs);

    }

    public void finish (Database.BatchableContext context) {
        System.debug('PurgeLogBatch - finish');
    }

    public static void start () {
        Database.executeBatch(new PurgeLogBatch());
    }

}