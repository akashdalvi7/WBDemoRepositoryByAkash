public class RestTest {
    private static JSONObject oauthLogin(String loginUri, String clientId,
        String clientSecret, String username, String password) {
        HttpRequest req = new HttpRequest(); 
 
        req.setMethod('POST');
        req.setEndpoint(loginUri+'/services/oauth2/token');
        req.setBody('grant_type=password' +
            '&client_id=' + clientId +
            '&client_secret=' + clientSecret +
            '&username=' + EncodingUtil.urlEncode(username, 'UTF-8') +
            '&password=' + EncodingUtil.urlEncode(password, 'UTF-8'));
    
        Http http = new Http();
  
        HTTPResponse res = http.send(req);

        System.debug('BODY: '+res.getBody());
        System.debug('STATUS:'+res.getStatus());
        System.debug('STATUS_CODE:'+res.getStatusCode());
        
        return new JSONObject(res.getBody());
    }
    
    public static String restTest(String name) {
        // use <a href="https://test.salesforce.com" target="_blank" rel="nofollow">https://test.salesforce.com</a> for sandbox orgs
        JSONObject oauth = oauthLogin(
'<a href="https://login.salesforce.com" , target="_blank" rel="nofollow">https://login.salesforce.com</a>',
            '3MVG9Y6d_Btp4xp7FzYaVu5vF71gsSBzmocLG_tS_o6g03cf9g0y.jEp2KISMhv6Q18vMkQuTAu5th5ABzZA_',
            '8081720642287737000', 
            'dalviakash666@gmail.com', 
            'ash_lovelife006');
            
        String accessToken = oauth.getValue('access_token').str,
               instanceUrl = oauth.getValue('instance_url').str;

        HttpRequest req = new HttpRequest(); 
 
        req.setMethod('GET');
        req.setEndpoint(instanceUrl+'/services/apexrest/TestRest?name='+name);
        req.setHeader('Authorization', 'OAuth '+accessToken);

        Http http = new Http();
  
        HTTPResponse res = http.send(req);

        System.debug('BODY: '+res.getBody());
        System.debug('STATUS:'+res.getStatus());
        System.debug('STATUS_CODE:'+res.getStatusCode());
        
        return res.getBody();
    }
}