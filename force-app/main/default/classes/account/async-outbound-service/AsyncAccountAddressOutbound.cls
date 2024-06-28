public class AsyncAccountAddressOutbound implements Queueable
                                            , Database.AllowsCallouts {

    static AccountRepository repository;
    static AccountAddressOutboundService outboundService;

    static {
        repository = new AccountRepository();
        outboundService = new AccountAddressOutboundService();
    }
        
    List<Account> accounts;
    
    public AsyncAccountAddressOutbound (List<Account> accounts) {
        this.accounts = accounts;
    }

    //Numero de Callouts - 100
    //120 segundos para      

    public void execute (QueueableContext context) {

        List<Account> accountsToUpdate = new List<Account>();

        for ( Account account : this.accounts ) {
              
            accountsToUpdate.add ( outboundService.findAddressByZipCode(account) );
            
        }

        repository.save(accountsToUpdate);

        
        //System.enqueueJob(new AsyncAccountAddressOutbound(...))

    }


    @future(callout=true)
    public static void enrichAddress ( List<String> accountIds ) {

        List<Account> accounts = repository.findByIds(accountIds);        

        List<Account> accountsToUpdate = new List<Account>();

        for ( Account account : accounts ) {
              
            accountsToUpdate.add ( outboundService.findAddressByZipCode(account) );
            
        }

        repository.save(accountsToUpdate);


    }



}