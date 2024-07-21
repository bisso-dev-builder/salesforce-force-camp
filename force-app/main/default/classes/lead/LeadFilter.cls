public class LeadFilter {

    public List<Lead> byNotEmptyMobileRecordType (List<Lead> leads) {

        List<Lead> filteredLeads = new List<Lead>();

        for (Lead lead: leads) {
            if ( String.isNotEmpty(lead.RecordTypeDeveloperNameMobile__c) ) {
                filteredLeads.add(lead);
            }
        }

        return filteredLeads;

    }

    public List<Lead> byNotEmptyDocumentAndPersonLead ( List<Lead> leads ) {
        return  byNotEmpty( 
                     byValue( leads, 'RecordTypeDeveloperName__c' , 'Person' )
                     , 'Cpf__c');
    }


    public List<Lead> byValue ( List<Lead> leads, String fieldName, String value ) {

        List<Lead> filtered = new List<Lead>();

        for (Lead lead : leads ) {

            String fieldValue = (String) lead.get(fieldName);

            if (  fieldValue == value ) {
                filtered.add(lead);
            }

        }

        return filtered;
    }



    public List<Lead> byNotEmpty ( List<Lead> leads, String fieldName ) {

        List<Lead> filtered = new List<Lead>();

        for (Lead lead : leads ) {

            String value = (String) lead.get(fieldName);

            if ( String.isNotEmpty(value)  ) {
                filtered.add(lead);
            }

        }

        return filtered;
    }

}