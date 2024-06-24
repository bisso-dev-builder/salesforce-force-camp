public class GetAddressOutboundService {

    public GetAddressOutboundService() {
    }

    public GetAddressResponse getAddress (String zipCode) {

        HttpRequest request = new HttpRequest();

        request.setEndpoint('https://viacep.com.br/ws/'+ zipCode  +'/json/');
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json');
        
        Http http = new Http();

        HttpResponse response = http.send(request);

        if (response.getStatusCode() != 200 ) {
            throw new GetAddressOutboundException (response.getBody());
        }

        System.debug( response.getStatusCode() );
        System.debug( response.getStatus() );
        System.debug( response.getBody() );

        return GetAddressResponse.fromJson( response.getBody() );

    }

    public class GetAddressOutboundException extends Exception {}

}