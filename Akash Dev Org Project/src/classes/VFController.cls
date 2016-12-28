public class VFController {
   // Constructor - this only really matters if the autoRun function doesn't work right
    private final Case c;
    public static Case assignToMyQueue{get;set;}
    public VFController(ApexPages.StandardController stdController) {
       this.c = (Case)stdController.getRecord();
       //System.debug('Current case record is : '+this.c);
    }  
   
   /*public static Case assignToMyQueue(ID caseId)
    {
        Case caseRecord = [Select Id, CaseNumber from Case Where Id =: caseId];
        String caseNumber = caseRecord.CaseNumber;
        System.debug('Current case record is : ' +caseRecord+ 'And Case Number is ' +caseNumber);
        //return 'Case Number is ' + caseNumber + ', User Id is ' + userId;
        return caseRecord;
    }*/

   public PageReference autoRun() {
      // assignToMyQueue(ApexPages.currentPage().getParameters().get('id'));
        String theId = ApexPages.currentPage().getParameters().get('id');
 
        if (theId == null) {
            // Display the Visualforce page's content if no Id is passed over
            return null;
        }
        
         for (Case c :[select Id, CaseNumber, Type from Case where id =:theId]) {
           System.debug('Current case record is : '+c);
            //Do all the dirty work we need the code to do
            }
       
        // Redirect the user back to the original page
        PageReference pageRef = new PageReference('/' + theId);
        pageRef.setRedirect(true);
        return pageRef;
   } 
}