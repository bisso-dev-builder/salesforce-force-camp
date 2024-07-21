public abstract class AbstractRepository {

    virtual
    public List<SObject> save ( List<SObject> records ) {
        upsert records;
        return records;
    }

    virtual
    public SObject save ( SObject record ) {        
        save ( new List<SObject> {record});
        return record;
    }



}