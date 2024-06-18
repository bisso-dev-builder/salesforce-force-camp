@isTest
public class LeadTriggerTest {

    public static Map<String, RecordTypeInfo> recordTypes = Lead.getSObjectType()
                                                        .getDescribe()
                                                        .getRecordTypeInfosByDeveloperName();

    @isTest
    public static void shouldChangeLead () {
        
        Lead lead = new Lead ( LastName = 'Bisso', Company = 'BissoCompany' );

        lead.RecordTypeDeveloperNameMobile__c = 'Person';

        insert lead;

        Assert.isNotNull(lead.Id, 'Id expected');

        Lead storedLead = [ SELECT Id, RecordTypeId FROM Lead WHERE Id = :lead.Id];

        Assert.areEqual( recordTypes.get('Person').getRecordTypeId()  
                        , storedLead.RecordTypeId ) ;

        lead.Street = 'Rua 15 Novembro';

        update lead;

        Assert.isNotNull(lead.Street, 'Street expected');
        

    }


}