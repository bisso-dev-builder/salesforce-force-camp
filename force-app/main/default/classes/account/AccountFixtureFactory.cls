@isTest
public class AccountFixtureFactory {

    public static Account createAccount (String name, String document, CNAE__c cnae) {
        return save( newAccount(name, document, cnae) );
    }
 
    public static Account newAccount (String name, String document, CNAE__c cnae) {

        Account account = newAccount (name,document);
        account.CNAE__c = cnae.Id;
        return account;

    }

    public static Account createAccount (String name, String document, String postalCode ) {
        return save( newAccount(name, document,postalCode) );
    }

    public static Account newAccount (String name, String document, String postalCode ) {
        
        Account account = newAccount (name,document);
        account.BillingPostalCode = postalCode;
        return account;
        
    }
    
    public static Account newAccount (String name, String document) {
        return new Account (Name = name, 
                        CpfCnpj__c = document,
                        BillingStreet =  'Rua Xyz');
    }

    public static Account save (Account account) {
        upsert account;
        return account;        
    }


    public static Map<String, SObject> createIntegratedScenario () {

        Map<String, SObject> records = new Map<String, SObject>();

        CNAE__c cnae = CnaeFixtureFactory.createCnae('1234242323');

        records.put ('cnae', cnae);

        Account account = AccountFixtureFactory.createAccount('jhsdfjhsdj'
                                                            , '123211323'
                                                            , cnae);
        records.put ('default-account', account);

        return records;
    }

}