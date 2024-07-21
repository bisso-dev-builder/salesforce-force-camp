public class AsyncLeadAddressService implements Queueable {

    List<Lead> leads;

    GetLeadAddressOutboundService service;

    LeadRepository repository;

    public AsyncLeadAddressService(List<Lead> leads) {
        this.leads = leads;
        this.service = new GetLeadAddressOutboundService();
        this.repository = new LeadRepository();
    }

    public void execute (QueueableContext context) {

        List<Lead> enrichedLeads = new List<Lead>();

        for (Lead lead : leads) {
            
            Lead enrichedLead = service.findAddressByZipCode(lead.Id, lead.PostalCode);

            enrichedLeads.add(enrichedLead);
        }

        repository.save(enrichedLeads);

    }

}