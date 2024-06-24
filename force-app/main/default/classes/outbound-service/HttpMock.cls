@isTest
public class HttpMock implements HttpCalloutMock {

    String payload;
    Integer httpCode;

    public HttpMock(){
        this.httpCode = 200;
    }

    public HttpMock(String payload) {
        this();
        this.payload = payload;
    }

    public HttpMock(String payload, Integer httpCode) {
        this(payload);
        this.httpCode = httpCode;
    }

    public HttpResponse respond (HttpRequest request) {
        
        System.debug( 'Debug estou aqui' );

        HttpResponse response = new HttpResponse();
        response.setBody(payload);
        response.setStatusCode(httpCode);
        return response;

    }

}