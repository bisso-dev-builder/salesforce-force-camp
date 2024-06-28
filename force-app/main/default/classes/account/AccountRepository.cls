/**
 * @author eduardo.bisso - dev-builder
 */
public virtual class AccountRepository {

    virtual
    public List<Account> findByTerm ( String billingState  ) {

        return Database.query('SELECT Id, Name, (SELECT Id, NAME FROM Addresses__r ) '
                        + ' FROM Account '
                        + ' WHERE BillingState = :billingState');
    }

    virtual
    public List<Account> findByBillingState (String billingState) {
        return [SELECT Id, Name, 
                 (SELECT Id, NAME FROM Addresses__r )
                FROM Account 
                WHERE BillingState = :billingState ];
    }

    virtual
    public List<Account> findByIds (List<String> ids) {
        
        return [SELECT Id, Name, BillingPostalCode
                FROM Account 
                WHERE Id = :ids ];
    }

    virtual 
    public List<Account> save ( List<Account> accounts ) {

        upsert accounts;

        return accounts;

    }

    virtual 
    public List<Account> save ( List<Account> accounts, SObjectField externalIdField ) {

        Database.upsert(accounts, externalIdField);

        return accounts;

    }

    virtual
    public void remove (List<Account> accounts) {
        delete accounts;
    }



}