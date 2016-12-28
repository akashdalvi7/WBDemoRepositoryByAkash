public class KeyValue{
 	//Last commited by Akash on Dec 28 2016
    public String key{get; set;}
    public String value{get; set;}
    public String fieldType{get; set;}

    public KeyValue(String key, String value, String fieldType){
        
        this.key = key;
        this.value = value;
        this.fieldType = fieldType.toUpperCase();
    }

    public KeyValue(String key, String value){
        this.key = key;
        this.value = value;
    }

    public KeyValue(){
    }
}