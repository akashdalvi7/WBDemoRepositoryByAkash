public class TestDataJsonLibrary {

public static String referenceKey='test';
    public class Standard{
    public final Map<String, String> libraryMap = new Map<String, String>{
    Constants.CONST_Account      => '{"attributes":{"type":"Account"},"Name":"testRmnAccount","'+referenceKey+'":"Reference Value"}',
    Constants.CONST_Contact      => '{"attributes":{"type":"Contact"},"Lastname":"testCont","'+referenceKey+'":"Reference Value"}',
    Constants.CONST_Opportunity  => '{"attributes":{"type":"Opportunity"},"Name":"NewOpp","'+referenceKey+'":"Reference Value","StageName" : "StageName" ,"CloseDate" : "2016-01-01"}'
    };
  }
}