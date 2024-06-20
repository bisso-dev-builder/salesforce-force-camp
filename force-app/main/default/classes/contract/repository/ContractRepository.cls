/**
 * @author eduardo.bisso - dev-builder
 */
public virtual class ContractRepository {
    
    virtual
    public List<AggregateResult> findActiveContractsByAccounts ( List<String> accountIds ) {
        return [SELECT SUM(TotalAmount__c) total
                , AccountId
                FROM Contract  
                WHERE AccountId IN :accountIds
                GROUP BY AccountId ];
    }


    

}