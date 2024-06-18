trigger Accounts on Account (before insert, before update) {

    List<Account> newAccounts = Trigger.new;

    Map<Id,Account> oldAccounts = Trigger.oldMap;

    switch on Trigger.operationType {
        
        when BEFORE_INSERT  {

            for (Account account : newAccounts) {

                if ( String.isNotEmpty(account.CpfCnpj__c)
                     && !account.CpfCnpj__c.isNumeric() ) {
                    account.CpfCnpj__c.addError('Documento Inválido');
                }

            }
    

        }

        when BEFORE_UPDATE {

            for (Account account : newAccounts) {

                Account oldAccount = oldAccounts.get(account.Id);                

                if ( account.CpfCnpj__c != oldAccount.CpfCnpj__c
                     && String.isNotEmpty(account.CpfCnpj__c)                    
                     && !account.CpfCnpj__c.isNumeric() ) {
                    account.CpfCnpj__c.addError('Documento Inválido');
                }

            }

        }

    }

}