@isTest
public class TestDataInsertData_Test{ 
  
    public static testMethod void insertAccount_Test(){
    KeyValue[] kvs = new KeyValue[]{};
    TestDataJsonLibrary.referenceKey = 'reference';
   
    kvs.add(new KeyValue('Name', 'testAkashAccount1', 'String'));
    TestDataInsertData  dataCl = new TestDataInsertData();
    Account ac1 = dataCl.insertAccount(kvs); //Insert Account without JSON String
    kvs.clear();
    
    String s =  '{"attributes":{"type":"Account"},"Name":"testAkashAccount2"}'; 
    kvs.add(new KeyValue('Name', 'testAkashAccount2', 'String'));
    Account ac2 = dataCl.insertAccount(s,kvs);    //Insert Account with JSON String
    kvs.add(new KeyValue('LastName', 'testAkashContact1', 'String'));
    kvs.add(new KeyValue('AccountId', ac2.id, 'ID'));
    Contact cnt1 = dataCl.insertContact(kvs);   //Insert Contact without JSON String
    kvs.clear();
    
    kvs.add(new KeyValue('Name', 'testAkashAccount3', 'String'));
    Account ac3 = dataCl.insertAccount(kvs); //Insert Account without JSON String
    
    String s1 =  '{"attributes":{"type":"Contact"},"LastName":"testAkashContact2"}'; 
    kvs.add(new KeyValue('LastName', 'testAkashContact2', 'String'));
    kvs.add(new KeyValue('AccountId', ac3.id, 'ID'));
    Contact cnt2 = dataCl.insertContact(s1, kvs);
   
    kvs.add(new KeyValue('Name', 'testAkashOpp1', 'String'));
    kvs.add(new KeyValue('AccountId', ac3.id, 'ID'));
    Opportunity o1 = dataCl.insertOpportunity(kvs);
    }

}