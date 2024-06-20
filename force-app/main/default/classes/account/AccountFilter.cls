
public class AccountFilter {



    public List<Account> byNotEmptyAndNotNumericCnpj (List<Account> accounts) {

        List<Account> filteredAccounts = new List<Account>();

        for (Account account : accounts) {

            if ( String.isNotEmpty(account.CpfCnpj__c)
                  && !account.CpfCnpj__c.isNumeric() ) {
                filteredAccounts.add(account);
            }

        }

        return filteredAccounts;

    }


    public List<Account> byChangedDocument ( List<Account> accounts
                                           , Map<Id, Account> oldAccounts ) {

        List<Account> filteredAccounts = new List<Account>();

        for (Account account : accounts) {

            Account oldAccount = oldAccounts.get(account.Id);                

            if ( account.CpfCnpj__c != oldAccount.CpfCnpj__c ) {

                filteredAccounts.add(account);
                
            }

        }

        return filteredAccounts;
    }

    public List<Account> byChangedCnpjAndNotEmptyAndNotNumeric (List<Account> accounts
                                                            , Map<Id, Account> oldAccounts) {

        return byNotEmptyAndNotNumericCnpj (
                    byChangedDocument(accounts, oldAccounts)
                );
    }

}