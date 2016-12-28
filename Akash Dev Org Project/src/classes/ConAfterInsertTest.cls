@IsTest
private class ConAfterInsertTest {
    public static testMethod void ContactTest()
    {
        Test.startTest();
        Contact con = new Contact();
        
        con.FirstName = 'Vaibhav';
        con.LastName = 'RRR';
        
        upsert con;
        Test.stopTest();
    }
}