public class UtilDML {
    
    public static Sobject setObjData(Sobject aobj, KeyValue[] kVals){
        Sobject thisobj;
        if (kVals != null){
            for (KeyValue eachval : kVals){
                try{
                    thisobj = setFieldVal(aobj, eachval);
                }
                catch(Exception ex){system.debug('## ex ' + ex); }
            }
        }
        
        return thisobj;
    }

    public static Sobject setFieldVal(Sobject obj, KeyValue thisKeyVal){
             
        system.debug('## thisKeyVal ' + thisKeyVal); 
        if (thisKeyVal.fieldtype == 'DATE'){ 
            String tmpDt = thisKeyVal.value;
            Date dt = Date.valueOf(tmpDt.substring(0,9).trim());
            system.debug('## dt ' + dt); 
            obj.put(thisKeyVal.key, dt);
        }else if (thisKeyVal.fieldtype == 'DATETIME'){
            system.debug('## Datetime.valueOf(tmpDt) ' + Datetime.valueOf(thisKeyVal.value));
            obj.put(thisKeyVal.key, Datetime.valueOf(thisKeyVal.value));
            system.debug('## obj ' + obj);
        }else if (thisKeyVal.fieldtype == 'DECIMAL')
            obj.put(thisKeyVal.key, decimal.valueof(thisKeyVal.value));
        else if (thisKeyVal.fieldtype == 'INTEGER')
            obj.put(thisKeyVal.key, integer.valueof(thisKeyVal.value));
        else if (thisKeyVal.fieldtype == 'LONG')
            obj.put(thisKeyVal.key, long.valueof(thisKeyVal.value));
        else if (thisKeyVal.fieldtype == 'DOUBLE')
            obj.put(thisKeyVal.key, Double.valueof(thisKeyVal.value));
        else if (thisKeyVal.fieldtype == 'BOOLEAN')
            obj.put(thisKeyVal.key, ((thisKeyVal.value).toUpperCase() == 'TRUE') );
        else if (thisKeyVal.fieldtype == 'BLOB')
            obj.put(thisKeyVal.key, Blob.valueof(thisKeyVal.value));
        else if (thisKeyVal.fieldtype == 'ID'){
            obj.put(thisKeyVal.key, ((ID)thisKeyVal.value));
        }else
            obj.put(thisKeyVal.key, thisKeyVal.value);//String
        
        system.debug('## obj ' + obj); 
        return obj;
        
    }
    public static sObject convertToSobject(Map<String, Object> objMap){
             
             system.debug('objMap======'+objMap);
             sObject sObj = Schema.getGlobalDescribe().get((String)((Map<String, Object>)objMap.get('attributes')).get('type')).newSObject();
             Map<String, Schema.SObjectField> sObjMap = sObj.getSObjectType().getDescribe().fields.getMap();
        
             for(String key : objMap.keySet()){
              
              if(sObjMap.containskey(key)){
               
               Schema.DescribeFieldResult field = sObjMap.get(key).getDescribe();
               
               String fieldType = field.getType().Name();
               String value = (String) objMap.get(key);
               
            if(fieldType == 'DATE'){ 
             
             sObj.put(key, Date.valueOf(value));
            }else if(fieldType == 'DATETIME'){
             
             sObj.put(key, Datetime.valueOf(value));
            }else if(fieldType == 'DECIMAL'){
             
             //sObj.put(key, Decimal.valueof(value));
             sObj.put(key, Decimal.valueOf(value));
            }else if(fieldType == 'INTEGER'){
             
             sObj.put(key, Integer.valueOf(value));
            }else if(fieldType == 'LONG'){
             
             sObj.put(key, Long.valueOf(value));
            }else if(fieldType == 'DOUBLE'){
             
             sObj.put(key, Double.valueOf(value));
            }else if(fieldType == 'BOOLEAN'){
             
             sObj.put(key, (value.toUpperCase() == 'TRUE'));
            }else{// String
             
             sObj.put(key, value);
            }
              }
             }
             
             return sObj;
    }

}