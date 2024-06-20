@isTest
public class ContractFixtureFactory {
    
    public static Contract createContract ( String name, Account account ) {
        return save(newContract(name, account));
    }
    
    public static Contract newContract( String name , Account account ) {
        return new Contract( Name = name
                        , AccountId = account.Id );
    }
    
    public static Contract save( Contract contract ) {
        upsert contract;
        return contract;
    }

    public static Map<String, SObject> createIntegratedScenario () {

        Map<String, SObject> records = AccountFixtureFactory.createIntegratedScenario ();

        Account account = (Account) records.get('default-account');

        Contract contract = createContract('231423432', account);
        
        records.put ('default-contract', contract);

        return records;
    }

}