public with sharing class DisplayContact1 {

    public DisplayContact1(ApexPages.StandardController controller) {

    }

    public List<Contact> conList {get;set;}
    public DisplayContact1(ApexPages.StandardSetController controller) {

    }
    public DisplayContact1 (){
    conList = [Select id,Name,Phone,Email,akash007__Customers_in_the_Store_right_now__c from contact where akash007__Customers_in_the_Store_right_now__c = true];
      System.debug('Contact List of Selected Account --->' +conList);
    }
    
    public PageReference ContactLists()
    {
    //if(ApexPages.currentPage().getParameters().get('id') != null)
      
     return null;
    }   

}