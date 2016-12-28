public class CurrentRecordIdDemoController{
public String currentRecordId {get;set;}
public String parameterValue {get;set;}
public Account acc{get;set;}
 
    public CurrentRecordIdDemoController(ApexPages.StandardController controller) {
        currentRecordId  = ApexPages.CurrentPage().getparameters().get('id');
        List<Account> acc = New List<Account> (); 
        acc = [select id ,name, AccountNumber, Type, Industry from Account where id =: currentRecordId ];
        system.debug('--->Account information<---' +acc);
        parameterValue = ApexPages.CurrentPage().getparameters().get('nameParam');
    }
}