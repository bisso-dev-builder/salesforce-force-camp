List<Account> accounts = new List<Account>();

List<String> zipCodes = new List<String> {
    '12230200', '12230300', '12230700', '12223300', '12223500'
};


for (Integer i = 0; i < 5; i++) {

    accounts.add (

        new Account (Name = 'Bisso Async Queueable De novo ' + i, 
                        CpfCnpj__c = '54234567890'+i,
                        BillingPostalCode =  zipCodes.get(i))

    );

}

insert accounts;