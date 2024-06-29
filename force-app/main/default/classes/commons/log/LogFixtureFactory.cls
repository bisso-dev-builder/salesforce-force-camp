@isTest
public class LogFixtureFactory {

    public static Log__c newLog (String message) {
        return new Log__c (Message__c = message);
    }

    public static List<Log__c> save (List<Log__c> logs) {   
        insert logs;
        return logs;
    }

}