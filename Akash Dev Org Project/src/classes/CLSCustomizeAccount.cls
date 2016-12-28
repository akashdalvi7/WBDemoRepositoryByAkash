public with sharing class CLSCustomizeAccount 
{
    public string feedback{get;set;}
    
    public CLSCustomizeAccount(ApexPages.StandardController controller) 
    {
        
    }
    
    public pagereference accountsaving()
    {
    
    if(string.isblank(feedback))
    {
        ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.Fatal,'Account Feedback should not be blank'));
    }
    return null;
    
    
    
    
    }
    

}