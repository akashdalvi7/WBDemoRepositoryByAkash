@IsTest
private class AccountSampleTriggerTest{
    public static testMethod void AccountTest()
    {
        Test.startTest();
        Account acc = new Account();
        acc.Name = 'Akash123';
        acc.Phone = '12345';
        acc.SLA__c = 'gold';
        insert acc;
        acc.Sic = 'Testing';
        upsert acc;
        Test.stopTest();
    }
}