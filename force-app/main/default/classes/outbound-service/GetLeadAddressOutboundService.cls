/**
 * @author eduardo.bisso - dev-builder
 */
public class GetLeadAddressOutboundService {
    
    GetAddressOutboundService outboundService;

    LeadAddressTransformer transformer;
    
    public GetLeadAddressOutboundService() {
        outboundService = new GetAddressOutboundService();
        transformer = new LeadAddressTransformer();
    }

    public Lead findAddressByZipCode (Id leadId, String zipCode) {

        GetAddressResponse address = outboundService.getAddress(zipCode);

        return transformer.toLead(address, leadId);
    }

}