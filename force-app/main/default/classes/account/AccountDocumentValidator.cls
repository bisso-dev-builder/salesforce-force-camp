public class AccountDocumentValidator {

    AccountFilter filter;

    public AccountDocumentValidator() {
        filter = new AccountFilter();
    }

    public List<Account> validate ( List<Account> accounts ) {

        List<Account> accountsWithInvalidDocument = this.filter.byNotEmptyAndNotNumericCnpj(accounts);

        for (Account account : accountsWithInvalidDocument ) {               
            account.CpfCnpj__c.addError('Documento Inválido');          
        }

        return accountsWithInvalidDocument;
    }


}