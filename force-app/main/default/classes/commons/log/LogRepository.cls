public class LogRepository {

    public List<Log__c> save (List<Log__c> logs) {
        upsert logs;
        return logs;
    }

    public Database.QueryLocator findLogToPurge () {
        return Database.getQueryLocator( [SELECT Id 
                                            FROM Log__c 
                                            ]);

    }

    public void remove (List<Log__c> logs) {
        Database.delete(logs, false);
    }



}