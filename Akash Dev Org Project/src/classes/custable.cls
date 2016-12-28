public with sharing class custable {

   public string recid{get;set;}
   public String imageURL{get;set;}
   public List<Contact> contacts {get; set;}
   public List<Contact> conList {get;set;}

   public custable(){
    conList = [Select id,Name,Phone,Email,akash007__Customers_in_the_Store_right_now__c from contact where akash007__Customers_in_the_Store_right_now__c = true];
    System.debug('Contact List of Selected Account --->' +conList);
   }

  public void setupContacts()
  {
      contacts = [select id, FirstName, LastName from Contact where Id=:recId];
       imageURL='/servlet/servlet.FileDownload?file=';
    List< Attachment > documentList=[select name from Attachment];

    if(documentList.size()>0)
    {
      imageURL=imageURL+documentList[0].id;
    }
       
  }
   
}