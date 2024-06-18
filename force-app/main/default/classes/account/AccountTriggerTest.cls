@isTest
public class AccountTriggerTest {

    @isTest
    public static void shouldBlockToInsertAccountWithWrongDocument () {

        CNAE__c cnae = CnaeFixtureFactory.createCnae('123213');

        Account account = AccountFixtureFactory.newAccount('Name', '123123131X', cnae);

        Test.startTest();

        try {

            insert account;

            Assert.fail('DmlException Expected');

        } catch (DmlException e) {
                        
            Assert.areEqual( 'Documento Inválido' , e.getDmlMessage(0));

        } 
        
        Test.stopTest();

    }

    @isTest
    public static void shouldBlockToChangeAccountWithWrongDocument () {

        Map<String,SObject> records = AccountFixtureFactory.createIntegratedScenario();

        Account account = (Account) records.get('default-account');

        Test.startTest();

        try {

            account.CpfCnpj__c = '0238723872S';

            update account;

            Assert.fail('DmlException Expected');

        } catch (DmlException e) {
                        
            Assert.areEqual( 'Documento Inválido' , e.getDmlMessage(0));

        } 
        
        Test.stopTest();

    }

}