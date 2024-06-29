Lead lead = new Lead ( LastName = 'Bisso'
                        , Company = 'Bisso SA' 
                        , Email = 'teste.outbound@mail.com'
                        , PostalCode = '12220400');

insert lead;

Lead lead = [SELECT Id, PostalCode FROM Lead WHERE Email = 'teste.outbound@mail.com'];


GetLeadAddressOutboundService leadAddressOutboundService = new GetLeadAddressOutboundService();

Lead leadWithAddress = leadAddressOutboundService.findAddressByZipCode( lead.Id, lead.PostalCode );

update leadWithAddress;

System.debug(JSON.serialize([SELECT Id, PostalCode, Street FROM Lead WHERE Email = 'teste.outbound@mail.com']));

//Lead lead = [SELECT Id, PostalCode, Street FROM Lead WHERE Email = 'teste.outbound@mail.com'];



GetAddressResponse address = new GetAddressOutboundService ().getAddress('12220000');

System.debug( address );