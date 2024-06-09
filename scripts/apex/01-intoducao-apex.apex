
Customer customerPremium = new Customer();
customerPremium.name = 'Bisso da Silva';

Customer customer = new Customer('Bisso da Silva');
customer.email = 'eduardo.carvalho@devbuilder.com.br';
customer.type = 'Premium';
customer.isActive = true;
customer.balance = 123213.21;
customer.employees = 879217L;
customer.createdDate = Date.today();
customer.lastModifiedDate = DateTime.newInstance (Date.today()
                                , Time.newInstance (20,20,00,00) );

customer.addContact ( 'João' , 'joao.s.m@mail.com' );
customer.addContact ( 'Jose' , 'jose@mail.com' );


Customer customerVarejo = new Customer('Bisso da Silva'
                                     , 'Em progresso'
                                     , 'dasddswas'
                                     , 'adsaasdsa'
                                     , true);


Customer customerVarejo = new Customer('Bisso da Silva'
                                     , 'Em progresso'
                                     , 'dasddswas'
                                     , '3123212')


Customer customerXyz = new Customer ( 'Bisso'
                                    , '3123211231'
                                    , '1321234234234'
                                    , '132133213213'
                                    , true
                                    , 123.0
                                    , 12311
                                    , null
                                    , null
                                    , null)                                     


