public with sharing class DisplayContact {

    public String contacts { get; set; }

    public PageReference setupContacts() {
        return null;
    }

    public List<Contact> conList {get;set;}
    public List<Contact> lstContact {get; set;}      
    public DisplayContact(ApexPages.StandardSetController controller) {
     
    }
    public  DisplayContact(){
    conList = [Select id,Name,Phone,Email,akash007__Customers_in_the_Store_right_now__c from contact where akash007__Customers_in_the_Store_right_now__c = true];
      System.debug('Contact List of Selected Account --->' +conList);
    }
    
    public PageReference ContactLists()
    {
         Map<Id,List<Contact>> SelectedCont = New Map<Id,List<Contact>> ();
         //lstContact = (List<Contact>)controller.getSelected();    
         

     return null;
    }   

}