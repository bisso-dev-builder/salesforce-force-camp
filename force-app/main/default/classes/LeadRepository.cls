/**
 * @author eduardo.bisso - dev-builder
 */
public class LeadRepository {


    public Lead save (Lead lead) {

        upsert lead;
        return lead;

    }

    public Lead findByEmail (String email) {

        List<Lead> leads = [ SELECT Id, LastName
                                , Email
                            FROM Lead  
                            WHERE Email = :email 
                            LIMIT 1];

        return !leads.isEmpty() ? leads.get(0) : null;

    }


}