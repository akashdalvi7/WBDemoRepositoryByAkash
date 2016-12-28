public class TriggerController {

    //used specifically in unit test data framework
    public static Map<System.Type, Boolean> rapidProcessing;

    //Account - Disable / Enable parts of trigger
    public static boolean Account_DisableAllTypes = false;
    public static boolean Account_DisableInsert = false;
    public static boolean Account_DisableUpdate = false;
    public static boolean Account_DisableDelete = false;
    public static boolean Account_DisableUnDelete = false;

    //used to unit test the trigger control to ensure the correct parts of the trigger were triggered
    public static boolean Account_Insert_Succeeded = false;
    public static boolean Account_Update_Succeeded = false;
    public static boolean Account_Delete_Succeeded = false;
    public static boolean Account_UnDelete_Succeeded = false;
    
    public void sampleMethod(){}

}