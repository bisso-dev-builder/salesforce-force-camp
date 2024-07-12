public class SearchAddressController {

    static AddressRepository repository;

    static {
        repository = new AddressRepository();
    }

    @AuraEnabled
    public static List<LookupSearchResult> search ( String term, String recordTypeDeveloperName ) {
        term = '%' + term + '%';

        List<LookupSearchResult> results = new List<LookupSearchResult>();


        try {
            
            List<Address__c> addresses =  repository.findByTermAndRecordType (term, recordTypeDeveloperName);

           
            for (Address__c address : addresses) {
                
                results.add ( new LookupSearchResult(address.Id
                                                    , 'Address__c'
                                                    , 'standard_Account'
                                                    , address.Address__Street__s
                                                    , address.Address__PostalCode__s
                                                        + ' - ' + address.Address__City__s  ) );

            }             

        } catch (DmlException e) {
            throw new AuraHandledException(e.getMessage());
        }

        return results;

    }

}