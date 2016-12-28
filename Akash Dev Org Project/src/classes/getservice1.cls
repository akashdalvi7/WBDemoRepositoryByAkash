@RestResource(urlMapping='/GetService/*')  
global with sharing class getservice1
{  
    @HttpGet 
    global static String getRestMethod() 
    {   
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String name = req.params.get('name');
        return 'Hello '+name+', you have just invoked a custom Apex REST web service exposed using REST API' ;
    }
    
    public PageReference showCalculator(){
    PageReference pgref = Page.Calculator;
    return pgref;
    }
}