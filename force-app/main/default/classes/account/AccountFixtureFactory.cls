@isTest
public class AccountFixtureFactory {

    public static Account createAccount (String name, String document, CNAE__c cnae) {
        return save( newAccount(name, document, cnae) );
    }

    public static Account newAccount (String name, String document, CNAE__c cnae) {
        return new Account (Name = name, 
                        CpfCnpj__c = document,
                        BillingStreet =  'Rua Xyz',
                        CNAE__c = cnae.Id );
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