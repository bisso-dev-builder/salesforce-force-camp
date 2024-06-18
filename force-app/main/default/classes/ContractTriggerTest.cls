@isTest
public class ContractTriggerTest {
    
    @isTest
    public static void shouldUpdateAccountWithTotalActiveContracts () {
        
        Map<String, SObject> records = AccountFixtureFactory.createIntegratedScenario ();

        Account account = (Account) records.get('default-account');

        Cnae__c cnae = (Cnae__c) records.get('cnae');

        Account otherAccount = AccountFixtureFactory.createAccount('Teste Other', '12321312', cnae);

        List<Contract> contracts = new List<Contract>();

        Decimal expectedTotal = 0;

        for ( Integer i = 0; i < 10; i++) {

            if ( Math.mod (i, 3) ==  0 ) {
                Contract contract = ContractFixtureFactory.newContract('231423432', account);
                contract.TotalAmount__c = 10;                
                contracts.add(contract);

                expectedTotal += contract.TotalAmount__c;
            }

        }



        Test.startTest();
        
        insert contracts;
        
        Test.stopTest();

        Account storedAccount = [SELECT Id, TotalActiveContracts__c 
                                  FROM Account WHERE Id = :account.Id ];


        Assert.areEqual(expectedTotal, storedAccount.TotalActiveContracts__c);


    }

}