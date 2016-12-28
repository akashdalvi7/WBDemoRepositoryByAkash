public virtual class TestDataComplexData extends TestDataInsertData{
    public List<Account> acc1;
    public List<Contact> cnt1;
    public Contact cont;
    public Account acc;
    public Opportunity opp;


    public Account insertContactAndAccount(Map<System.Type, List<KeyValue>> keyMap){
        //inserts just 1 Account and 1 Contact and links them together, using the map in the argument means you only need to use 1 argument 
        //stops a null exception occurring later in the code
        if(keyMap == null){ 
            keyMap = new Map<System.Type, List<KeyValue>>();
            keyMap.put(Contact.class, new List<KeyValue>());
        }else if(keyMap.containsKey(Contact.class) == false)
            keyMap.put(Contact.class, new List<KeyValue>());
        
        
        this.acc = super.insertAccount(keyMap.get(Account.class));

        // now provide the Id into the KeyValues to link the Objects together
        keyMap.get(Contact.class).add(new KeyValue('AccountId', this.acc.id, 'ID'));

        
        this.cont = super.insertContact(keyMap.get(Contact.class));
        
        return this.acc;
    }


    public Account insertContactOpportunityAndAccount(Map<System.Type, List<KeyValue>> keyMap){

    insertContactAndAccount(keyMap);

    if(keyMap.containsKey(Opportunity.class) == false)
                keyMap.put(Opportunity.class, new List<KeyValue>());

        keyMap.get(Opportunity.class).add(new KeyValue('AccountId', this.acc.id, 'ID'));
        
        this.opp = super.insertOpportunity(keyMap.get(Opportunity.class));
        
        return this.acc;
    }

}