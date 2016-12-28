public class exampleCon {

    public exampleCon(ApexPages.StandardController controller) {

    }

    Integer count = 0;
                        
    public PageReference incrementCounter() {
           System.debug('Hi..this is akash dalvi');
           PageReference pageRef = new PageReference('http://www.google.com');
           return  pageRef;
    }
                    
    public Integer getCount() {
        return count;
    }
}