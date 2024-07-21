@isTest
public class LeadEventEnricherTest {

    @isTest
    public static void shouldScheduleMeeting () {
        
        Lead lead = LeadFixtureFactory.newLead ('Nome', '123213121');

        Test.startTest();
        
        LeadEventEnricher enricher = new LeadEventEnricher ();
        enricher.setEventRepository( new EventRepositoryMock() );

        List<Event> events = enricher.schedulePrimerMeeting ( new List<Lead> {lead} );
               
        Test.stopTest();

        Assert.areEqual( 1 , events.size());

        Event actualEvent = events.get(0);
        
        Assert.areEqual( 'Reunião apresentação' , actualEvent.Subject );
        Assert.isNotNull( actualEvent.Id );

    }   


    @isTest
    public static void shouldNotScheduleMeetingAndReturnError () {
        
        Lead lead = LeadFixtureFactory.newLead ('Nome', '123213121');

        Test.startTest();
        
        LeadEventEnricher enricher = new LeadEventEnricher ();

        enricher.setEventRepository( new EventRepositoryErrorMock() );

        try {

            List<Event> events = enricher.schedulePrimerMeeting ( new List<Lead> {lead} );

            Assert.fail('Expected DmlException');

        } catch (DmlException e ) {

            Assert.isTrue(true, 'expected exception');

            Assert.areEqual('Error message', e.getMessage());            

        }
               
        Test.stopTest();

    }

}