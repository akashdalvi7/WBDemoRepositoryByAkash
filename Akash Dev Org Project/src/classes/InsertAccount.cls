@RestResource(urlMapping='/insertAccount/*')     
global class InsertAccount
{

@Httppost
global static String InsertAccount()
{  


    // Insert Account Using Post Method


    Account  acc = new Account();
    String jsonStr = null;

    if (null != RestContext.request.requestBody){

    jsonStr = RestContext.request.requestBody.toString();
    Map<String, object> m = (Map<String, object>)JSON.deserializeUntyped(jsonStr );
    system.debug('******'+m );
    acc.Name=(String)m.get('Name');
    acc.Phone=(String)m.get('Phone');
    insert acc;
   }
    return 'Account Inserted';
}


 @HttpGet
global static String InsertAccountRest()
{   

           // Insert Account Using Get Method

    Account  acc1 = new Account();
    acc1.Name=RestContext.request.params.get('Name');
    acc1.Phone=RestContext.request.params.get('Phone');
    insert acc1;

    return 'Account Inserted';
}
}