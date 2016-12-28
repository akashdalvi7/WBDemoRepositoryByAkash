public virtual class TestDataBulkData extends TestDataInsertData{
    
    public List<Contact> cnt;
    
    /*public Account insertAccountAndContacts(Map<System.Type, KeyValueBulk> keyMap){
        //This inserts 1 Account and a number of Contacts and stops a null exception occurring later in the code
        if(keyMap == null){
            keyMap = new Map<System.Type, KeyValueBulk>();
            keyMap.put(Contact.class, new KeyValueBulk()); 
        }else if(kMaps.containsKey(Contact.class) == false)
            kMaps.put(Contact.class, new KeyValueBulk());
        
        this.conts = new List<Case>();
        Account acc = super.insertAccount(keyMap.get(Account.class) .keyValueBulkLst); 
        
        bulkModeOn = true; // stops records being inserted
        
            //link records together
            (keyMap.get(Contact.class)).keyValueBulkLst.add(new KeyValue('AccountId', acc.id, 'ID'));
            List<KeyValueBulk> kVals = (keyMap.get(Contact.class)).keyValueBulkLst;
            
            for(Integer i = 0; i < (keyMap.get(Contact.class)).insertRecs; i++)
                this.conts.add(super.insertContact(kVals));
            
            insert this.conts;
        
        bulkModeOn = false; //resets flag
        
        return this.acc;
    }*/
    public Account insertAccountAndContacts(Map<System.Type, KeyValueBulk> keyMap){
            //This inserts 1 Account and a number of Contacts
            
            list<KeyValue> kvList = new list<KeyValue>();
            //stops a null exception occurring later in the code
            
            if(keyMap == null){
                    keyMap = new Map<System.Type, KeyValueBulk>();
                    keyMap.put(Contact.class, new KeyValueBulk(1,kvList)); 
            }
            else if(keyMap.containsKey(Contact.class) == false) {
                    keyMap.put(Contact.class, new KeyValueBulk(1,kvList));
            }
            
            this.cnt = new List<Contact>();
            Account acc = super.insertAccount(keyMap.get(Account.class).keyValueBulkLst); 
            
            bulkModeOn = true; // stops records being inserted
            
            //link records together
            (keyMap.get(Contact.class)).keyValueBulkLst.add(new KeyValue('AccountId', acc.id, 'ID'));
            List<KeyValue> kVals = (keyMap.get(Contact.class)).keyValueBulkLst;
             
            for(Integer i = 0; i < (keyMap.get(Contact.class)).insertRecs; i++) {
                  this.cnt.add(super.insertContact(kVals));
            }
             
            insert this.cnt;
            bulkModeOn = false; //resets flag
            
            return acc;
    }
}