/**
 * @author Pat Patterson - ppatterson@salesforce.com
 */

public abstract class OAuthRestController {
    static String clientId = '3MVG9Y6d_Btp4xp7FzYaVu5vF77qEk0y_iGvHzdmXyk71gTL75PCoi5rOmM7f_kMqP9THR3Y7iXsRl9i_DwZg'; // Set this in step 3
    static String clientSecret = '4692916739247047542'; // Set this in step 3
    static String redirectUri = '<a href="https://c.ap1.visual.force.com/apex/GetService" target="_blank" rel="nofollow">https://c.ap1.visual.force.com/apex/GetService</a>'; // YOUR PAGE URL IN THE SOURCE ORG
    static String loginUrl = '<a href="https://akashdalvi-dev-ed.my.salesforce.com" target="_blank" rel="nofollow">https://akashdalvi-dev-ed.my.salesforce.com</a>'; // YOUR MY DOMAIN URL IN THE TARGET ORG
    static String cookieName = 'oauth';

    public PageReference login() {
        // Get a URL for the page without any query params
        String url = ApexPages.currentPage().getUrl().split('\\?')[0];
       
        System.debug('url is '+url);

        String oauth = (ApexPages.currentPage().getCookies().get(cookieName) != null ) ?
            ApexPages.currentPage().getCookies().get(cookieName).getValue() : null;
        if (oauth != null) {
            // TODO - Check for expired token
        }
       
        System.debug('oauth='+oauth);
        if (oauth != null) {
            // All done
            return null;
        }
       
        // If we get here we have no token
        PageReference pageRef;
       
        if (! ApexPages.currentPage().getParameters().containsKey('code')) {
            // Initial step of OAuth - redirect to OAuth service
            System.debug('OAuth Step 1');
       
            String authuri = loginUrl+'/services/oauth2/authorize?'+
                'response_type=code&client_id='+clientId+'&redirect_uri='+redirectUri;
                           
            pageRef = new PageReference(authuri);
        } else {
            // Second step of OAuth - get token from OAuth service
            String code = ApexPages.currentPage().getParameters().get('code');

            System.debug('OAuth Step 2 - code:'+code);
               
            String body = 'grant_type=authorization_code&client_id='+clientId+
                '&redirect_uri='+redirectUri+'&client_secret='+clientSecret+
                '&code='+code;
            System.debug('body is:'+body);
               
            HttpRequest req = new HttpRequest();
            req.setEndpoint(loginUrl+'/services/oauth2/token');
            req.setMethod('POST');
            req.setBody(body);
       
            Http h = new Http();
            HttpResponse res = h.send(req);
   
            String resp = res.getBody();
            System.debug('FINAL RESP IS:'+EncodingUtil.urlDecode(resp, 'UTF-8'));
           
            ApexPages.currentPage().setCookies(new Cookie[]{new Cookie(cookieName,
                res.getBody(), null,-1,false)});
               
            // Come back to this page without the code param
            // This makes things simpler later if you end up doing DML here to<br>            // save the token somewhere<br>            pageRef = new PageReference(url);
            pageRef.setRedirect(true);
        }
       
        return pageRef;
    }
   
    public static String getRestTest() {
        String oauth = (ApexPages.currentPage().getCookies().get(cookieName) != null ) ?
            ApexPages.currentPage().getCookies().get(cookieName).getValue() : null;
        JSONObject oauthObj = new JSONObject( new JSONObject.JSONTokener(oauth));
           
        String accessToken = oauthObj.getValue('access_token').str,
               instanceUrl = oauthObj.getValue('instance_url').str;

        HttpRequest req = new HttpRequest();
 
        req.setMethod('GET');
        req.setEndpoint(instanceUrl+'/services/apexrest/superpat/TestRest?name=Pat');
        req.setHeader('Authorization', 'OAuth '+accessToken);

        Http http = new Http();
 
        HTTPResponse res = http.send(req);

        System.debug('BODY: '+res.getBody());
        System.debug('STATUS:'+res.getStatus());
        System.debug('STATUS_CODE:'+res.getStatusCode());
       
        return res.getBody();
    }
}