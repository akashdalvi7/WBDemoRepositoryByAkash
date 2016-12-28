public virtual class TestDataInsertData extends TestDataReturnData{

    public sObject insertAnyObject(String jsonStr, KeyValue[] kVals, System.Type objType){
         sObject sobj;
        if(overrideJson != null && overrideJson.containsKey(objType)){
            jsonStr = overrideJson.get(objType);
            }
        //updated by Akash to check kVals is empty or not    
         if(kVals.size() > 0){
             sobj = super.returnAnyObject(jsonStr, kVals)[0];
         // set to true if inserting multiple records
         if(bulkModeOn == false)
             insert sobj;
         }      
        return sobj;
    }
    
    // method with json string
    public Contact insertContact(String jsonstr, KeyValue[] kVals){        
        return (Contact) insertAnyObject((jsonstr != null && jsonstr != '') ? jsonstr : new TestDataJsonLibrary.Standard().libraryMap.get(Constants.CONST_Contact), kVals, Contact.class); 
    }
    // method without json string
    public Contact insertContact(list<KeyValue> kVals){
        return (Contact) insertAnyObject(new TestDataJsonLibrary.Standard().libraryMap.get(Constants.CONST_Contact), kVals, Contact.class);
    }
    // method without json string
    public Account insertAccount(list<KeyValue> kVals){
       return (Account) insertAnyObject(new TestDataJsonLibrary.Standard().libraryMap.get(Constants.CONST_Account), kVals, Account.class);
    }
    // method with json string
    public Account insertAccount(String jsonstr, list<KeyValue> kVals){        
        return (Account) insertAnyObject((jsonstr != null && jsonstr != '') ? jsonstr : new TestDataJsonLibrary.Standard().libraryMap.get(Constants.CONST_Account), kVals, Account.class); 
    }
    public Opportunity insertOpportunity(list<KeyValue> kVals){
        return (Opportunity) insertAnyObject(new TestDataJsonLibrary.Standard().libraryMap.get(Constants.CONST_Opportunity), kVals, Opportunity.class);
    }
    
}