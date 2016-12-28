@IsTesT
public class AccountTestForAkashTest{
    public static testMethod void accountTest(){
    Test.startTest();
    Account a = new Account(Name='AkashDalvi', AccountNumber='1234567', Phone='123456789');
    insert a;
    AccountTestForAkash.checkAccountTransaction();
    Test.stopTest();
       
    
    
  }
}