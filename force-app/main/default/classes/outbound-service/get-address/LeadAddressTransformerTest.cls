/**
 * @author eduardo.bisso - dev-builder
 */
@isTest
public class LeadAddressTransformerTest {

    @isTest
    public static void shouldConvertAddressIntoLead () {

        Lead lead = createLead(); 

        String payload = '{ "cep": "12220-400", "logradouro": "Avenida José de Moura Candelaria", "complemento": "", "unidade": "", "bairro": "Vila Industrial", "localidade": "São José dos Campos", "uf": "SP", "ibge": "3549904", "gia": "6452", "ddd": "12", "siafi": "7099" }';

        GetAddressResponse addressResponse = GetAddressResponse.fromJson(payload);

        Test.startTest();
        
        Lead leadWithAddress = new LeadAddressTransformer().toLead(lead.Id, addressResponse);        

        Test.stopTest();

        Assert.areEqual(addressResponse.logradouro, leadWithAddress.Street);
        Assert.areEqual(addressResponse.localidade, leadWithAddress.City);
        Assert.areEqual(addressResponse.uf, leadWithAddress.State);
        Assert.areEqual(addressResponse.cep, leadWithAddress.PostalCode);

    }


    public static Lead createLead () {

        Lead lead = new Lead ( LastName = 'Bisso'
                        , Company = 'Bisso SA' 
                        , Email = 'teste.outbound@mail.com'
                        , PostalCode = '12220400');

        insert lead;

        return lead;
    }


}