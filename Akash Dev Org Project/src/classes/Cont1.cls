public class Cont1 {
    private ApexPages.StandardController standardController;
    List<Account> accounts;
    Account a = new Account();
    public Account getName {get;set;}
    public Cont1(ApexPages.StandardController controller) {
    this.standardController = standardController;
    }
    public PageReference Clickme() {
        PageReference reference=Page.Display;
        reference.setRedirect(true);
        return reference;
    }
    
    public List<Account> getAccounts() {

                if(accounts == null) accounts = [select name, phone from account limit 10];

                return accounts;

        }
   
}