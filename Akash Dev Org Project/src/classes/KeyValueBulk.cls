public class KeyValueBulk{

public integer insertRecs;
public KeyValue[] keyValueBulkLst;

    public KeyValueBulk(integer insRecs, KeyValue[] kys){
    insertRecs  = (insertRecs != null && insertRecs > 0) ? insertRecs : 1;
    keyValueBulkLst = kys;
    }
}