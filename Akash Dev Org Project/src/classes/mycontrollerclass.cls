public with sharing class mycontrollerclass {

    public PageReference next() {
        return null;
    }


    public PageReference previous() {
        return null;
    }


    public List<Member_Description__c> getAllMember() {
    
        allMember = new List<Member_Description__c>();
        allMember.add(new Member_Description__c());
      // allMember = [select Name__c,Phone__c from Member_Description__c];
        return allMember ;
    }
 
   
    public string SelectedRecordId { get; set; }
    List<Member_Description__c> allMember{get; set;}
    
    
     public List<Member_Description__c> getAlMember() {
    
        alMember = new List<Member_Description__c>();
        //alMember.add(new Member_Description__c());
       alMember = [select Name__c,Phone__c from Member_Description__c];
        return alMember ;
    }
 
   
    
    List<Member_Description__c> alMember{get; set;}
    public mycontrollerclass(){
    allMember = new List<Member_Description__c>();
    } 
    
    public PageReference newrec() {
        return null;
    }


    public PageReference Cancel() {
        return null;
    }

   public PageReference save() {
        
        upsert allMember; 
        return null;
    }
    public void DeleteRecord(){
    if (SelectedRecordId == null) {
            return;
        }
      Member_Description__c tobeDeleted = null;
      for(Member_Description__c a : alMember ){
          if (a.Id == SelectedRecordId) {
                tobeDeleted = a;
                break;
            }
            if (tobeDeleted != null) {
                Delete tobeDeleted;
            }
      }
      getAlMember();
    }

}