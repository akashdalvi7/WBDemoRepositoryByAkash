public class Editpageext {
   
public String str {get; set;}
public String Name{get; set;}
public usar__c us {get; set;}
 public Editpageext() {
        str = ApexPages.currentPage().getParameters().get('id');
us=[SELECT name,akash007__Email__c,akash007__Phone__c FROM akash007__Usar__c where id=: str];

    }

/*public Editpageext(ApexPages.StandardController controller) {
str = ApexPages.currentPage().getParameters().get('id');
us=[SELECT name,akash007__Email__c,akash007__Phone__c FROM akash007__Usar__c where id=: str];
}
*/
public pagereference save()
{
us.Name = Name;
update us; 
pagereference ref = new pagereference('/apex/ViewPage?id='+us.id);
ref.setredirect(true);
return ref;
}
public pagereference Cancel()
{
pagereference ref = new pagereference('/apex/ViewPage?id='+str);
return ref;
}
}