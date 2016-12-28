public class google_redir {
    public PageReference hello1() {
        PageReference reference=new PageReference('http://www.google.com');
        reference.setRedirect(true);
        return reference;
    }
}