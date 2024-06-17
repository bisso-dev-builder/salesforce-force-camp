@isTest
public class AccountRepositoryTest {

    @isTest
    public static void shouldCreateAccountWithBillingStreet() {

        // crio registros dentro da plataforma 
        // para q meu teste possa ser executado

        // --------------- preparacao - setup

        CNAE__c cnae = new CNAE__c( Code__c = '12321'
                                   , Description__c = '12312' );

        insert cnae;

        List<Account> databaseAccounts = [SELECT Id FROM Account];

        Assert.isTrue( databaseAccounts.isEmpty() );

        List<Account> accounts = new List<Account> {
            new Account (Name = 'Xyz', 
                        CpfCnpj__c = '12345678901234',
                        BillingStreet = 'Rua Xyz' ,
                        CNAE__c = cnae.Id )
        };

        // ------------------

        Test.startTest();

        AccountRepository repository = new AccountRepository();

        List<Account> storedAccounts = repository.save(accounts);

        System.debug( Limits.getDmlRows() );
        System.debug( Limits.getQueryRows() );

        Test.stopTest();

        Assert.areEqual(1, storedAccounts.size() );
        Assert.isNotNull( storedAccounts.get(0).Id, 'O Id de Account deve ser informado' );
        Assert.isNotNull( storedAccounts.get(0).BillingStreet, 'Deve ser informado o BillingStreet' );

    }
    
}