public without Sharing class ResetPage{
    public ResetPage() {
    }
    /*
    public PageReference reset() {
        PageReference pg = new PageReference(System.currentPageReference().getURL());
        pg.setRedirect(false);
        return pg;
    }
    */
    
    public PageReference reset() {
    PageReference pg= new PageReference('http://www.google.com');
    pg.setRedirect(true);
    return pg;
    
    }
}