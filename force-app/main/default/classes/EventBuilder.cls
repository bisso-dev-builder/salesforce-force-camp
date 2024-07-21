public class EventBuilder {

    public Event toEvent ( Lead lead ) {

        return new Event (
            Subject = 'Reunião apresentação'
            , WhoId = lead.Id
            , DurationInMinutes = 30
            , StartDateTime = Date.today().addDays (7)            
        );

    }

}