public class AccountSelectClassController1{
    
    //Our collection of the class/wrapper objects wrapAccount
    public List<wrapAccount> wrapAccountList {get; set;}
    public List<Account> selectedAccounts{get;set;}
 
    public AccountSelectClassController1(){
            String id = ApexPages.currentPage().getParameters().get('id');
            if(wrapAccountList == null) {
            wrapAccountList = new List<wrapAccount>();
            for(Account a: [select Id, Name,BillingState, Website, Phone from Account limit 10]) {
                // As each Account is processed we create a new wrapAccount object and add it to the wrapAccountList
                wrapAccountList.add(new wrapAccount(a));
            }
        }
    }

   public PageReference processSelected(){
   selectedAccounts = new List<Account>();   
   for (wrapAccount w : wrapAccountList) {
           if(w.selected) {
                 selectedAccounts.add(w.acc);      
            }
        }
        PageReference pg = new PageReference('/apex/WrapperAccountEXChild');
        return pg;
   }
    
    // This is our wrapper/container class. In this example a wrapper class contains both the standard salesforce object Account and a Boolean value
    public class wrapAccount {
        public Account acc {get; set;}
        public Boolean selected {get; set;}
   
        public wrapAccount(Account a) {
            acc = a;
            selected = false;
        }
    }
}