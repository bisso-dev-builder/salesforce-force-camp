trigger Contracts on Contract (after insert, after update, after delete) {

    List<Contract> newContracts = Trigger.new;

    Map<Id,Contract> oldContracts = Trigger.oldMap;

    switch on Trigger.operationType {
        
        when AFTER_INSERT, AFTER_UPDATE {
            
            Set<String> accountIds = new Set<String> ();            
            for ( Contract contract : newContracts )   {
                accountIds.add(contract.AccountId);
            }

            List<AggregateResult> activeContracts = [SELECT SUM(TotalAmount__c) total
                                                      , AccountId
                                                    FROM Contract  
                                                    WHERE AccountId IN :accountIds
                                                    GROUP BY AccountId ];

            List<Account> accountsToUpdate = new List<Account> ();
            
            for ( AggregateResult contract : activeContracts ) {

                accountsToUpdate.add ( new Account (Id = (String) contract.get('AccountId')
                                        , TotalActiveContracts__c = (Decimal) contract.get('total') )  );

            }

            update accountsToUpdate;


        }
    }
}