public class SampleCon{
    public void insertacc()
    {
        Account myAccount = new Account(Name='Acme');
        insert myAccount;
        Account acct = [SELECT Id FROM Account WHERE Name = 'Acme' LIMIT 1];
        String fullRecordURL = URL.getSalesforceBaseUrl().toExternalForm() + '/' + acct.Id;
        System.debug('**********' +fullRecordURL );        
    }
}