/**
 * @author eduardo.bisso - dev-builder
 */
public virtual class LeadRepository {


    public List<Lead> save (List<Lead> leads) {

        upsert leads;
        return leads;

    }

    public Lead save (Lead lead) {

        upsert lead;
        return lead;

    }

    virtual
    public Lead findByEmail (String email) {

        List<Lead> leads = [ SELECT Id, LastName
                                , Email
                            FROM Lead  
                            WHERE Email = :email 
                            LIMIT 1];

        return !leads.isEmpty() ? leads.get(0) : null;

    }

    virtual
    public Lead findById (String id) {
        return [ SELECT Id, Street, City, State, PostalCode 
                 FROM Lead
                 WHERE Id =:id ];
    }

}