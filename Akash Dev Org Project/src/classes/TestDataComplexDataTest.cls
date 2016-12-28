@isTest
public class TestDataComplexDataTest{
    public static testMethod void checkConAcc(){
    Map<System.Type, List<KeyValue>> keyMap = new Map<System.Type, List<KeyValue>>();
    KeyValue[] kvs = new KeyValue[]{};
    //this will overwrite the Email field with a new email
    kvs.add(new KeyValue('Name', '18Aug2015_Ash', 'String'));
    kvs.add(new KeyValue('LastName', '18Aug2015_Ash', 'String'));

    keyMap.put(Contact.class, kvs);

    TestDataComplexData dataCl = new TestDataComplexData ();
    dataCl.insertContactAndAccount(keyMap);

    }


}