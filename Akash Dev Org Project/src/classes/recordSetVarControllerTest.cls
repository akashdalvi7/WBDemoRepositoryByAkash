@isTest
public class recordSetVarControllerTest{
    public static testMethod void recordSetTest(){
    Account [] newAccount1= [select id,name from Account where Name= 'GenePoint'];
    PageReference testPage = new pagereference('/apex/RecordSetVariableEx');
    testPage.getParameters().put('id', 'newAccount1.id');
    Test.setCurrentPage(testPage);
    ApexPages.StandardSetController sc = new ApexPages.StandardSetController(newAccount1);
    recordSetVarController rs = new recordSetVarController(sc);
    rs.str = 'akash';
    }

}