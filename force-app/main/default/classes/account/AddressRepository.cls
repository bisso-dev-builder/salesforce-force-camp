
public class AddressRepository {

    public List<Address__c> findByTermAndRecordType (String term, String recordTypeDeveloperName ) {

        return [ SELECT Id, Name, Address__Street__s
                , Address__City__s, Address__PostalCode__s
                , Address__StateCode__s 
                FROM Address__c 
                WHERE ( Address__Street__s LIKE :term
                    OR Address__City__s LIKE :term
                    OR Address__PostalCode__s LIKE :term )
                    AND RecordType.DeveloperName = :recordTypeDeveloperName
                ORDER BY Address__Street__s
            ];
    }
 
}