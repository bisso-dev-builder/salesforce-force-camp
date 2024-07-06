public class AddressController {

    static GetAddressOutboundService service;

    static {
        service = new GetAddressOutboundService();
    }


    @AuraEnabled
    public static ZipCodeAddress findAddressByZipCode ( String zipCode ){

        GetAddressResponse response = service.getAddress(zipCode);

        ZipCodeAddress address = new ZipCodeAddress();

        address.zipCode = zipCode;
        address.street = response.logradouro;
        address.city = response.localidade;
        address.state = response.uf;

        return address;


            
    }

}