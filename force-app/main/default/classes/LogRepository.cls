public class LogRepository {

    public List<Log__c> save (List<Log__c> logs) {
        upsert logs;
        return logs;
    }

}