public class recordSetVarController {
public List<Account> obj{get;set;}
public string str{get;set;}
   public recordSetVarController(ApexPages.StandardSetController controller) {
       obj =  controller.getSelected();
   }
}