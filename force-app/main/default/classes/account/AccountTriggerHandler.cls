/**
 * @author eduardo.bisso - dev-builder
 */
public with sharing class AccountTriggerHandler extends TriggerHandler {    
    
    List<Account> newAccounts;
    Map<Id, Account> oldAccounts;

    AccountFilter filter;
    AccountDocumentValidator documentValidator;

    public AccountTriggerHandler() {
        this( (List<Account>) Trigger.new
            , (Map<Id, Account>) Trigger.oldMap );
    }

    public AccountTriggerHandler(List<Account> newAccounts
                                , Map<Id, Account> oldAccounts) {

        this.newAccounts = newAccounts;
        this.oldAccounts = oldAccounts;

        this.filter = new AccountFilter();
        this.documentValidator = new AccountDocumentValidator();
    }

    override
    public void beforeInsert() {

        validateDocument();             

    }

    override
    public void beforeUpdate() {

        validateChangedDocument();
        
    }
    

    private void validateDocument() {
        validateDocument (newAccounts);
    }

    private void validateChangedDocument () {

        List<Account> accountsWithChangedDocument = this.filter.byChangedDocument (newAccounts
                                                                                , oldAccounts);

        validateDocument (accountsWithChangedDocument);
    
    }

    private void validateDocument(List<Account> accounts) {
        this.documentValidator.validate(accounts);
    }

}