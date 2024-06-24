/**
 * @author eduardo.bisso - dev-builder
 */
public class GetLeadAddressOutboundService {
    
    GetAddressOutboundService outboundService;
    
    public GetLeadAddressOutboundService() {
        outboundService = new GetAddressOutboundService();
    }

    public Lead findAddressByZipCode (Id leadId, String zipCode) {

        GetAddressResponse address = outboundService.getAddress(zipCode);

        return new Lead ( Id = leadId,
                Street = address.logradouro,
                City = address.localidade,
                State = address.uf,
                PostalCode = address.cep
         );

    }

}