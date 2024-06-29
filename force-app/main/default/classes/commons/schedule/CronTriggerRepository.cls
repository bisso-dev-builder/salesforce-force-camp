public class CronTriggerRepository {

    public List<CronTrigger> findByName (String name) {

        return [SELECT Id, CronJobDetail.Name    
                , NextFireTime
                , PreviousFireTime
                , State
                , StartTime
                , EndTime
                , CronExpression  
                FROM  CronTrigger
                WHERE CronJobDetail.Name LIKE :name ];
    }

}