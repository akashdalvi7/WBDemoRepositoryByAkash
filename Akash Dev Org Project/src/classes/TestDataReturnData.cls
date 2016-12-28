public abstract class TestDataReturnData implements ITestData{

public Boolean bulkModeOn = false;

public Map<System.Type, String> overrideJson = new Map<System.Type, String>();

    public List<sObject> returnAnyObject(String jsonStr, KeyValue[] kVals){

        List<sObject> sobj;
        
        if(jsonStr.contains(TestDataJsonLibrary.referenceKey)) {
            jsonStr = getFilteredJsonString(jsonStr, kVals);
            system.debug('=========jsonStr===filtered======'+jsonStr);
        }
        
        if(jsonStr.startsWith('[')){
            sobj = (List<sObject>) System.Json.deserialize(jsonStr, List<sObject>.class);
            }
        else{
            sobj = (List<sObject>) System.Json.deserialize('['+jsonStr+']', List<sObject>.class);
            }
        system.debug('=========sobj=========='+sobj);    
        if(kVals != null){
            for(sObject obj : sobj)
               obj = UtilDML.setObjData(obj, kVals);
        }
        
        return sobj;
    }


    private String getFilteredJsonString(String jsonStr, KeyValue[] kVals){      
        //List<Object> deserialLst = (List<Object>) JSON.deserializeUntyped(jsonStr.unescapeEcmaScript());   updated by akash to remove map to list error
        map<String,Object> deserialLst = (map<String,Object>) JSON.deserializeUntyped(jsonStr.unescapeEcmaScript());
                        
        String aReferenceKey;
        
    //when setting the fields from the KeyValues if 1 is the lookup field set to  aReferenceKey 
        for(KeyValue kv : kVals){           
            if(kv.key == TestDataJsonLibrary.referenceKey){         
                aReferenceKey = kv.value;
                break;
            }
        }
            
        List<sObject> serialLst = new List<sObject>();
        
        //updated by akash for deserialLst map
        
        //for(Object obj : deserialLst){
          //  Map<String, Object> objMap = (Map<String, Object>) obj;
                if(aReferenceKey!=deserialLst.get(TestDataJsonLibrary.referenceKey)){                  
                    deserialLst.remove(TestDataJsonLibrary.referenceKey);
                    serialLst.add(UtilDML.convertToSobject(deserialLst));
                }
           
        //}
        return JSON.serialize(serialLst);
    }
    
   
}