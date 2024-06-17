@isTest
public class OpportunityTest {
    
    @isTest
    public static void shouldCreateOpportunity () {

        Map<String, SObject> records = ContractFixtureFactory.createIntegratedScenario ();

        Account account = (Account) records.get('default-account');

        Contract contract = (Contract) records.get('default-contract');                                       

 
        Pricebook2 pricebook = new Pricebook2 ( Name = 'Test' );
        
        insert pricebook;
    

        Test.startTest();
        
        Opportunity opportunity = new Opportunity ( Name =  'Test',
                StageName = 'Closed Won',
                CloseDate = Date.today().addDays(30),
                AccountId = account.Id,
                Pricebook2Id = pricebook.Id,
                ContractId = contract.Id
        );
        
        insert opportunity;
        
        Test.stopTest();

        Assert.isNotNull(opportunity.Id);
        
        
    }

}
