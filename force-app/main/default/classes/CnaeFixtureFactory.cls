@isTest
public class CnaeFixtureFactory {
    
    public static CNAE__c createCnae (String code) {
        return save( newCnae(code) );
    }

    public static CNAE__c newCnae (String code) {
        return new CNAE__c (Code__c = code, 
                        Description__c = 'Teste CNae' );
    }

    public static CNAE__c save (CNAE__c cnae) {
        upsert cnae;
        return cnae;        
    }



}