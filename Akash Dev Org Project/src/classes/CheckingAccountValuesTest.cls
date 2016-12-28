@IsTest
Private class CheckingAccountValuesTest {
    public static testMethod void CheckingAccountValue()
    {
        Test.startTest();
        Account acc = new Account();
        acc.Name = 'Akash123456';
        acc.Phone = '12345';
        acc.SLA__c = 'gold';
        insert acc;
        Test.stopTest();
    
    }
}