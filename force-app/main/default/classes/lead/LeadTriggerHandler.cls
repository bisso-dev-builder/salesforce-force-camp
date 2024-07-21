/**
 * @author eduardo.bisso - dev-builder
 */
public with sharing class LeadTriggerHandler extends TriggerHandler {

    private List<Lead> newLeads;
    private Map<Id, Lead> oldLeads;

    private LeadEnricher enricher;

    private LeadFilter filter;

    private LeadDocumentValidator documentValidator;

    public LeadTriggerHandler() {
        this ( (List<Lead>) Trigger.new
             , (Map<Id, Lead>) Trigger.oldMap );
    }

    public LeadTriggerHandler(List<Lead> newLeads, Map<Id, Lead> oldLeads) {
        this.newLeads = newLeads;
        this.oldLeads = oldLeads;
        
        this.enricher = new LeadEnricher();
        this.filter = new LeadFilter();
        this.documentValidator = new LeadDocumentValidator();
    }

    override
    public void beforeInsert() {
        validateDocument();
        enrichRecordType();
        enrichAddress();
    }

    override
    public void beforeUpdate() {
        validateDocument();
        enrichRecordType();
        enrichAddress();
    }


    private void enrichRecordType () {
        this.enricher.enrich(newLeads);
    }

    private void validateDocument () {

        List<Lead> filteredLeads = filter.byNotEmptyDocumentAndPersonLead(newLeads);

        documentValidator.validate(filteredLeads);

    }

    private void enrichAddress () {
        System.enqueueJob(new AsyncLeadAddressService(newLeads));
    }

}