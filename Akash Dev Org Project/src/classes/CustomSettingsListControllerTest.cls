@IsTest
public class CustomSettingsListControllerTest{
    private static testMethod void checkcountry(){
    Test.startTest();
    Country__c c = new Country__c();
    PageReference pageRef = Page.CustomSettingsList;
    Test.setCurrentPage(pageRef);
    ApexPages.Standardcontroller sc = new ApexPages.Standardcontroller(c);
    ApexPages.currentPage().getParameters().put('Id',c.id);
    c.Name = 'United Kingdom';
    c.Country_Code__c = 'UK';
    insert c;
    Test.stopTest();
    }

}