public class LeadEnricher {

    static Map<String, RecordTypeInfo> recordTypes = Lead.getSObjectType()
                                                           .getDescribe()
                                                           .getRecordTypeInfosByDeveloperName();

    LeadFilter filter;

    public LeadEnricher() {
        filter = new LeadFilter();
    }

    public List<Lead> enrich ( List<Lead> leads ) {

        List<Lead> leadsToEnrich = filter.byNotEmptyMobileRecordType(leads);

        for (Lead lead: leadsToEnrich) {            

            lead.RecordTypeId = recordTypes.get(lead.RecordTypeDeveloperNameMobile__c)
                                           .getRecordTypeId();

        }

        return leadsToEnrich;

    }

}