trigger Leads on Lead (before insert, before update, after insert, after update) {

    // System.debug( ' Contexto de Insert : BEFORE ' +  Trigger.isBefore + ' ' + Trigger.isInsert );    
    // System.debug( ' Contexto de Insert : AFTER  ' +  Trigger.isAfter  + ' ' + Trigger.isInsert );

    // System.debug( ' Contexto de Update : BEFORE ' +  Trigger.isBefore + ' ' + Trigger.isUpdate );    
    // System.debug( ' Contexto de Update : AFTER  ' +  Trigger.isAfter  + ' ' + Trigger.isUpdate );

    // System.debug('----------------------------------');
    // System.debug('Valores Novos ' + Trigger.new );
    // System.debug('Valores Anteriores ' + Trigger.oldMap );

    static Map<String, RecordTypeInfo> recordTypes = Lead.getSObjectType()
        .getDescribe()
        .getRecordTypeInfosByDeveloperName();

    List<Lead> newLeads = Trigger.new;

    Map<Id,Lead> oldLeads = Trigger.oldMap;

    switch on Trigger.operationType {
        
        when BEFORE_INSERT, BEFORE_UPDATE  {

            for ( Lead lead : newLeads ) {

                if ( String.isNotEmpty(lead.RecordTypeDeveloperNameMobile__c)) {

                    lead.RecordTypeId = recordTypes.get(lead.RecordTypeDeveloperNameMobile__c).getRecordTypeId();

                }

            }
        }
    }   

}