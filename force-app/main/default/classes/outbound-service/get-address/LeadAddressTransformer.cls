/**
 * @author eduardo.bisso - dev-builder
 */
public class LeadAddressTransformer {

    public Lead toLead ( Id leadId, GetAddressResponse address ) {
        return new Lead ( Id = leadId,
            Street = address.logradouro,
            City = address.localidade,
            State = address.uf,
            PostalCode = address.cep
        );
    }

}