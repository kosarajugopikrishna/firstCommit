public class ZipClass {
//Normal Status Code
    private static String API_STATUS_NORMAL = '200';
//Error Status Code
    private static String API_STATUS_ERROR  = '400';
// Normal JSON Response
    public static string normalJson( Object respData ) {
        Map<String, Object> response = new Map<String, Object>();
        response.put('status', API_STATUS_NORMAL);
        if( respData != null ) 
        response.put('data', respData);
        return json.serialize( response );
        
     }
// Error JSON Response
    Public static String errorJson( String message ) {
        Map<String, Object> response = new Map<String, Object>();
        response.put('status', API_STATUS_ERROR);
        if( message != null )
        response.put('error', message);
        return json.serialize( response );
      }}