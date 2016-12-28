public class MyController {

    Account account;
    public PageReference save() {
        PageReference MyFirstPage = Page.MyFirstPage;
        MyFirstPage.setRedirect(true);
        return MyFirstPage;
    }
    
    /*public PageReference save() {
        PageReference pageref = new PageReference('https://www.google.com');
        pageref.setRedirect(true);
        return pageref;
    }*/
    public String getName() {
        return 'MyController';
    }
   public Account getAccount() {
        if(account == null)
            account = [select id, name from Account where id = :ApexPages.currentPage().getParameters().get('id')];
           return account;
    }
}