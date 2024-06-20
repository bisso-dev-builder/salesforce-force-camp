@isTest
public class AccountDocumentValidatorTest {
    
    @isTest
    public static void shouldAddErrorWithInvalidDocument () {

        Account account = AccountFixtureFactory.newAccount('Bisso Account', '3123123X');

        AccountDocumentValidator validator = new AccountDocumentValidator();

        List<Account> accounts = validator.validate( new List<Account> {account});

        Assert.isTrue( accounts.get(0).hasErrors() );
        
    }

}