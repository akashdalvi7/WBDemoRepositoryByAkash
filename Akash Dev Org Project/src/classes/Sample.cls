public class Sample { 

    public Id Aid {get;set;}
    
    public Sample(ApexPages.StandardController controller) {
        //Account acc = new Account();
        Aid = controller.getId();
    }         
}