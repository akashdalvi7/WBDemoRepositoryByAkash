@IsTest(SeeAllData=true) 
public class AccountTransactionTest{
    public static void accountTest(){
    Account a = new Account(Name='AkashDalvi', AccountNumber='1234567');
    insert a;
    AccountTransaction.checkAccountTransaction();
      
  }
}