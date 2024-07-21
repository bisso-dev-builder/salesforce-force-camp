@isTest
public class LeadInboundServiceTest {
    
    
    @isTest
    public static void shouldFindLead () {

        RestContext.request = new RestRequest();        
        RestContext.request.params.put( 'email' , 'bisso@mail.com' );
        RestContext.response = new RestResponse();

        String payload = '{"Id":"00QHs00001xh1KIMAY","Email":"bisso@mail.com","LastName":"Bisso da Silva"}';

        LeadInboundService.repository = new LeadRepositoryTest.LeadRepositoryMock(payload);

        Test.startTest();
        
        Lead lead = LeadInboundService.findByEmail();
                
        Test.stopTest();

        



    }

}