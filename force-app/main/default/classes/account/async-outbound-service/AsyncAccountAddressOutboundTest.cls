@isTest
public class AsyncAccountAddressOutboundTest {

    @isTest
    public static void shouldGetAccountBillingAddressByZipCode () {
        
        String payload = '{ "cep": "12220-400", "logradouro": "Avenida José de Moura Candelaria", "complemento": "", "unidade": "", "bairro": "Vila Industrial", "localidade": "São José dos Campos", "uf": "SP", "ibge": "3549904", "gia": "6452", "ddd": "12", "siafi": "7099" }';        
        
        Test.setMock( HttpCalloutMock.class, new HttpMock(payload));

        Test.startTest();

        Account account = AccountFixtureFactory.createAccount('Teste Async', '12345678901'
                                            , '12220000');
        Test.stopTest();
        
        Account storedAccount = [SELECT Id, BillingStreet 
                                    FROM Account 
                                    WHERE Id = :account.Id];

        Assert.areEqual( 'Avenida José de Moura Candelaria' , storedAccount.BillingStreet);

    }
    
}