@isTest
public class ContactMobNoTest {
    
    
    static testMethod void checkMobNum(){
        
        String temp;
        Schema.DescribeSObjectResult cfrSchema = Schema.SObjectType.Account; 
        Map<String,Schema.RecordTypeInfo> AccountRecordTypeInfo = cfrSchema.getRecordTypeInfosByName();
        account a = new account();
        a.name = 'Test Account';
        a.recordTypeId = AccountRecordTypeInfo.get('Account Test').getRecordTypeId();
        Insert a;
        
        
        Contact c = new contact();
        c.lastName = 'Test Last ';
        c.firstName = 'First Name';
        c.Salutation = 'Mr';
        c.accountId = a.id ;
        c.MobilePhone = '447845552559';
        c.Email = 'test124@test.com';
        insert c;
        
        
        Test.startTest();
        c.MobilePhone = '447845552559007';
        try {
           update c;
        }
        catch (DmlException ex) {

      System.assertEquals(StatusCode.FIELD_CUSTOM_VALIDATION_EXCEPTION, ex.getDmlType(0));
      //System.assertEquals(' FIELD_CUSTOM_VALIDATION_EXCEPTION,', ex.getDmlMessage(0));
        }
        Test.stopTest();
    }

}