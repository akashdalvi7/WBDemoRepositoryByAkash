@isTest
public class TestDataUpdateDataTest{
    public static testMethod void UpdateAcc(){
        TestDataInsertData_Test.insertAccount_Test();
        
        KeyValue[] kvs = new KeyValue[]{};
        KeyValue[] kvs1 = new KeyValue[]{};
        
        TestDataJsonLibrary.referenceKey = 'reference';
        kvs.add(new KeyValue('Name', 'testAkashAccount1', 'String'));
        TestDataInsertData  dataCl = new TestDataInsertData();
        Account ac1 = dataCl.insertAccount(kvs); //Insert Account without JSON String
        
        kvs1.add(new KeyValue('Name', 'testAkashAccount999', 'String'));
        kvs.add(new KeyValue('AccountID', ac1.ID, 'ID'));
        
        test.startTest();
        TestDataUpdateData updata = new TestDataUpdateData();
        updata.updateAccount(kvs,kvs1);
        test.stopTest();
        
    }
    

}