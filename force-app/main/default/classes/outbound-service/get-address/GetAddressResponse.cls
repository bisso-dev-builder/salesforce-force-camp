public class GetAddressResponse {

    public String cep;
    public String logradouro;
    public String localidade;
    public String complemento;
    public String unidade;
    public String bairro;
    public String uf;
    public String ibge;
    public String gia;
    public String ddd;
    public String siafi;

    public GetAddressResponse() {
    }

    public static GetAddressResponse fromJson (String payload) {
        return (GetAddressResponse) JSON.deserialize(payload, GetAddressResponse.class);
    }

    override
    public String toString() {
        return JSON.serialize(this);
    }

}