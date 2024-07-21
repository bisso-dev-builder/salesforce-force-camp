public class LeadAddressTransformer {
    
    public Lead toLead ( GetAddressResponse address, String leadId ) {

        return new Lead ( Id = leadId,
                Street = address.logradouro,
                City = address.localidade,
                State = address.uf,
                PostalCode = address.cep
         );

    }


}