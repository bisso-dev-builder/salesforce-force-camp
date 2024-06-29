/**
 * @author eduardo.bisso - dev-builder
 */
@isTest
public class LogPurgeJobTest {
    
    @isTest
    public static void shouldRunSchedule () {

        LogPurgeJob.abort();

        Test.startTest();
        
        LogPurgeJob.start();
        
        Test.stopTest();

        Assert.isTrue(true);

    }

    @isTest
    public static void shouldScheduleJob () {

        LogPurgeJob.abort();
       
        LogPurgeJob.start();
    
        List<CronTrigger> jobs = new CronTriggerRepository().findByName('LogPurgeJob%');

        Assert.isFalse(jobs.isEmpty());

        Assert.areEqual( '0 36 19 * * ? *', jobs.get(0).CronExpression);

    }    


}