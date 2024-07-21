public class LeadEventEnricher {

    EventRepository repository;

    EventBuilder eventBuilder;

    public LeadEventEnricher() {
        eventBuilder = new EventBuilder();
        repository = new EventRepository();
    }

    public List<Event> schedulePrimerMeeting (List<Lead> leads) {

        List<Event> events = new List<Event>();
        
        for (Lead lead : leads) {

            events.add ( eventBuilder.toEvent(lead) );

        }

        repository.save(events);

        return events;

    }

    public void setEventRepository(EventRepository repository) {
        this.repository = repository;
    }

}