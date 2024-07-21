@isTest
public class EventRepositoryErrorMock extends EventRepository {
    
    public EventRepositoryErrorMock() {

    }

    override
    public List<SObject> save (List<SObject> records ) {
        
        if (true) {
            throw new DmlException ('Error message');
        }

        return records;
    }

}