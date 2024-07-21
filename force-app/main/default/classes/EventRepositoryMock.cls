@isTest
public class EventRepositoryMock extends EventRepository {
    
    public EventRepositoryMock() {

    }

    override
    public List<SObject> save (List<SObject> records ) {
        System.debug('EventRepositoryMock.save');
        IdGenerator.generate(records);
        return records;
    }

}