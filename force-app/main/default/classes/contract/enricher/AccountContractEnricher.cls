/**
 * @author eduardo.bisso - dev-builder
 */
public class AccountContractEnricher {

    ContractRepository repository;

    AccountRepository accountRepository;
    
    public AccountContractEnricher() {
        this.repository = new ContractRepository();
        this.accountRepository = new AccountRepository();
    }

    public List<Account> enrichWithTotalActiveContract ( List<Contract> contracts ) {

        List<String> accountIds = Lists.pullField(contracts, 'AccountId');

        List<AggregateResult> activeContracts = this.repository
                                                            .findActiveContractsByAccounts(accountIds);

        List<Account> accountsWithTotalContracts = buildAccountsWithTotalContract (
                                                                    activeContracts);

        return this.accountRepository.save( accountsWithTotalContracts );
        
    }

    private List<Account> buildAccountsWithTotalContract ( List<AggregateResult> activeContracts ) {

        List<Account> accountsToUpdate = new List<Account> ();
        
        for ( AggregateResult contract : activeContracts ) {

            accountsToUpdate.add ( new Account (Id = (String) contract.get('AccountId')
                                    , TotalActiveContracts__c = (Decimal) contract.get('total') )  );

        }

        return accountsToUpdate;

    }

}