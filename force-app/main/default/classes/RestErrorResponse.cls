/**
 * @author eduardo.bisso - dev-builder
 */
global class RestErrorResponse {

    String errorMessage;

    public RestErrorResponse ( DmlException e ) {
        this.errorMessage = e.getDmlMessage(0);
    }

    override
    public String toString () {
        return JSON.serialize(this);
    }

}