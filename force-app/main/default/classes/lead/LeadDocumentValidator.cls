/**
 * @author eduardo.bisso - dev-builder
 */
public class LeadDocumentValidator {

    PersonDocumentValidator validator;

    public LeadDocumentValidator() {

        validator = new PersonDocumentValidator();

    }

    public List<Lead> validate (List<Lead> leads ) {

        for ( Lead lead: leads ) {

            validateDocument (lead);
            
        }

        return leads;

    }

    void validateDocument (Lead lead) {
    
        if (!validator.isCPF( lead.Cpf__c )) {
            lead.Cpf__c.addError('Documento inválido');
        }

    }

}