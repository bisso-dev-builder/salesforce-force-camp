/**
 * @author eduardo.bisso - dev-builder
 */
@RestResource(urlMapping='/api/leads')
global class LeadInboundService {
    
    @TestVisible
    static LeadRepository repository;

    static LogRepository logRepository;

    static {
        repository = new LeadRepository();
        logRepository = new LogRepository();
    }    

    //Criar um Dado
    @HttpPost
    global static void create (Lead lead) {
       
        List<Log__c> logs = new List<Log__c>();
        
        logs.add ( new Log__c ( Message__c = 'Lead recebido : ' + JSON.serialize (lead)) );

        RestContext.response.statusCode = 200;

        Savepoint savePoint = Database.setSavepoint();
        
        try {            
            
            lead = repository.save(lead);

            RestContext.response.responseBody = Blob.valueOf( JSON.serialize(lead) );
                        
        } catch (DmlException e ) {
        
            Database.rollback(savepoint);

            RestContext.response.statusCode = 400;
           
            logs.add ( new Log__c ( Message__c = 'Erro ao processar o lead : ' 
                                                + JSON.serialize (lead)
                                                + '\n ' +  e.getDmlMessage(0)  ) );
            
            RestContext.response.responseBody = Blob.valueOf( new RestErrorResponse(e).toString() );

        } finally {

            logRepository.save (logs);

        }                

    }

    @HttpPut
    global static Lead change (Lead lead) {
        return repository.save(lead);
    }

    @HttpPatch
    global static Lead changeStatus (String id, String status) {        
        Lead lead = new Lead (Id = id
                            , Status = status);
        return repository.save(lead);
    }

    @HttpGet
    global static Lead findByEmail () {        
        
        // service/apexrest/api/leads?email=asdsadsaasd@mail.com
        Map<String, String> parameters = RestContext.request.params;

        String email = parameters.get('email');

        return repository.findByEmail(email);
    }


}