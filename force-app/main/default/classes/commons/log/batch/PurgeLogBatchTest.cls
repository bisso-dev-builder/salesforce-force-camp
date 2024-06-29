@isTest
public class PurgeLogBatchTest {

    @TestSetup
    public static void setup () {

        List<Log__c> logs = new List<Log__c>();

        for (Integer i=0; i < 5; i++ ) {
            logs.add ( LogFixtureFactory.newLog('Line '+ i)  );
        }      

        LogFixtureFactory.save (logs);

        Date oldLogDate = Date.today().addDays(-40);

        Test.setCreatedDate(logs.get(0).Id, oldLogDate );
        Test.setCreatedDate(logs.get ( logs.size() - 1 ) .Id, oldLogDate );
    }

    @isTest
    public static void shouldCleanAllLogs () {

        System.debug(JSON.serialize([ SELECT Id, CreatedDate FROM Log__c]));

        List<AggregateResult> result = [ SELECT COUNT(Id) total FROM Log__c];

        Assert.areEqual( 5 , (Integer) result.get(0).get('total') );

        Test.startTest();
        
        PurgeLogBatch.start();
        
        Test.stopTest();
        
        result = [ SELECT COUNT(Id) total FROM Log__c];

        Assert.areEqual( 0 , (Integer) result.get(0).get('total') );


    }

}