/**
 * @author eduardo.bisso - dev-builder
 */
@isTest
public class GetAddressOutboundServiceTest {

    @isTest
    public static void shouldFindAddressByZipCode () {

        String payload = '{ "cep": "12220-400", "logradouro": "Avenida José de Moura Candelaria", "complemento": "", "unidade": "", "bairro": "Vila Industrial", "localidade": "São José dos Campos", "uf": "SP", "ibge": "3549904", "gia": "6452", "ddd": "12", "siafi": "7099" }';        
                
        Test.setMock( HttpCalloutMock.class, new HttpMock(payload));
        
        Test.startTest();
        
        GetAddressResponse address = new GetAddressOutboundService ()
                                                        .getAddress('12220400');
                
        Test.stopTest();

        Assert.isNotNull(address);
        Assert.isNotNull(address.logradouro);
        Assert.isNotNull(address.localidade);
        Assert.isNotNull(address.uf);

    }

    @isTest
    public static void shouldReturnGetAddressException () {

        String payload = '{ "error" : "message" }';        
        
        Test.setMock( HttpCalloutMock.class, new HttpMock(payload, 403));
                
        Test.startTest();
        
        try {

            GetAddressResponse address = new GetAddressOutboundService ()
                                                            .getAddress('12220400');

            Assert.fail('Expected GetAddressOutboundException');

        } catch (GetAddressOutboundService.GetAddressOutboundException e) {
            Assert.isTrue( e != null );
        }

                
        Test.stopTest();

       

    }


}