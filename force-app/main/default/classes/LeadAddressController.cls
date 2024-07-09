/**
 * @author eduardo.bisso - dev-builder
 */
public with sharing class LeadAddressController {
    
    static LeadRepository repository;

    static {
        repository = new LeadRepository();
    }


    @AuraEnabled
    public static Lead findById ( String id ){
        return repository.findById(id);
    }

    @AuraEnabled
    public static Lead save ( Lead lead ){
        
        return repository.save(lead);    

    }


}