public virtual class TestDataUpdateData extends TestDataInsertData{

    public Account updateAccount(KeyValue[] insertkVals, KeyValue[] updatekVals){       
        Account acc = super.insertAccount(insertkVals);
        
        if(updatekVals != null)
            acc = (Account) UtilDML.setObjData(acc, updatekVals); 
        
        update acc; 
        
        return acc;
    }

}