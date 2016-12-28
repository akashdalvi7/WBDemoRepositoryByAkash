public with sharing class Casevisit {

    public String getVisitedUserName { get; set; }

    public Casevisit() {

    }


    Visited_Users__c var = new Visited_Users__c();
    List<Visited_Users__c> listVar = new  List<Visited_Users__c>();
    
    
    /*public String getVisitedUserName(){
     String str = null;
     Visited_Users__c var = new Visited_Users__c();
     str = UserInfo.getFirstName();
     var.VisitedUserName__c = str;
     return str;
    }*/
    public List<Visited_Users__c> getVisitedUserName() {
    String userName = UserInfo.getUserName();
    User activeUser = [Select Name From User where Username = : userName limit 1];
    String uname = activeUser.Name;
    var.VisitedUserName__c = uname;
    listVar.add(var);
    insert listVar;    
    return listVar;
    
    }

}