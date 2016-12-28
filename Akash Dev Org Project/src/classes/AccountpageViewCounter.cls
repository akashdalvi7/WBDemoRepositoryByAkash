public class AccountpageViewCounter{
    public Account acc {get;set;}
    public User us{get;set;}
    public decimal count;
    
    public AccountpageViewCounter(ApexPages.StandardController controller){
        
    }
    
    public pageReference updateCount(){
        
        acc = [select id,akash007__Number_of_times_page_viewed__c from Account where id =: ApexPages.currentPage().getParameters().get('id')];
        us = [select name from User where id =: UserInfo.getUserId()];
            if(acc.akash007__Number_of_times_page_viewed__c==null){
                acc.akash007__Number_of_times_page_viewed__c= 1;
                acc.akash007__Last_viewed_by__c = us.Name;
            }
            else{
                acc.akash007__Number_of_times_page_viewed__c += 1;
                acc.akash007__Last_viewed_by__c = us.Name;
            }
            update acc;
            return null;
            
    }
}