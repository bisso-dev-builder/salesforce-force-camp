public class AccountAddressOutboundService {
    
    GetAddressOutboundService service;

    public AccountAddressOutboundService() {
        this.service = new GetAddressOutboundService();
    }


    public Account findAddressByZipCode ( Account account ) {

        GetAddressResponse response = service.getAddress(account.BillingPostalCode);
       
        return new Account ( Id = account.Id
                    , BillingStreet = response.logradouro
                    , BillingCity = response.localidade
                    , BillingState = response.uf
                     );
    }

}