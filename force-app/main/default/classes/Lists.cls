public class Lists {
    
    public static List<String> pullField (List<SObject> records, String fieldName) {

        if (  records.isEmpty() ) return new List<String>();
        
        Set<String> filtered = new Set<String>();
        
        for ( SObject record : records  ) {

            Object fieldValue = record.get(fieldName);

            if ( fieldValue == null ) continue;
            
            filtered.add ( '' + fieldValue );
        }        
        
        return new List<String> ( filtered );
    }
    
}