public with sharing class ContractTriggerHandler extends TriggerHandler {
    
    List<Contract> newContracts;

    Map<Id,Contract> oldContracts;

    AccountContractEnricher enricher;

    public ContractTriggerHandler() {
        this( (List<Contract>) Trigger.new 
            , (Map<Id,Contract>) Trigger.oldMap);
    }

    public ContractTriggerHandler(List<Contract> newContracts
                                , Map<Id,Contract> oldContracts ) {
        this.newContracts = newContracts;                                    
        this.oldContracts = oldContracts; 
        this.enricher = new AccountContractEnricher ();
    }

    override
    public void afterInsert() {
        enrichAccountWithTotalActiveContract();
    }

    override
    public void afterUpdate() {
        enrichAccountWithTotalActiveContract();
    }
        
    private void enrichAccountWithTotalActiveContract () {
       this.enricher.enrichWithTotalActiveContract(newContracts);
    }

}