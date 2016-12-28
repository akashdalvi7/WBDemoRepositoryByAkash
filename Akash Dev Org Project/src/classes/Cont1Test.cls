@isTest
class Cont1Test{
    public static testMethod void checkcont(){
    Account newContact= new Account();
    newContact.Name='contact1';
    newContact.Phone='1223456778';
    insert newContact;
    Account [] newContact1= [select id,name from Account where Name= 'contact1'];
    PageReference testPage = new pagereference('/apex/ContactLink');
    testPage.getParameters().put('id', 'newContact1.id');
    Test.setCurrentPage(testPage);
    ApexPages.StandardController sc = new ApexPages.standardController(newContact);
    Cont1 c = new Cont1(sc);
    test.StartTest();
    PageReference track = c.Clickme();
    c.getAccounts();
    test.StopTest();
    
    
    }
}