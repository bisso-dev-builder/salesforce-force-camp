Account account = new Account();
account.Name = 'Bisso Account';
account.BillingStreet = 'End do Bisso';
account.addError ('CPF não informado');

System.debug( account.hasErrors() );

System.debug( account.get ('Name') );

Lead lead = new Lead();
lead.Company = 'Xyz';
lead.LastName = 'asdsadasas';

lead.addError ('First Name não informado');

System.debug( lead.hasErrors() );

System.debug( lead.get ('LastName') );

System.debug( lead.toString() );

Customer customer = new Customer();
customer.name = 'Bisso';

System.debug( customer.toString() );
