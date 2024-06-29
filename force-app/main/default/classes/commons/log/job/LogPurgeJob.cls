/**
 * @author eduardo.bisso - dev-builder
 */
public class LogPurgeJob implements Schedulable {
    
    public LogPurgeJob() {
    }

    public void execute ( SchedulableContext context ) {

        System.debug( 'Job Id ' + context.getTriggerId() );

    }

    public static void start () {   

        System.schedule('LogPurgeJob'
                        , '0 36 19 * * ? *'
                        , new LogPurgeJob());
    }

    public static void abort () {

        new Scheduler().abort('LogPurgeJob%');

    }

}