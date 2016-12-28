public class AccountTestForAkash{
    public static void checkAccountTransaction(){
       Account a = new Account(Name = 'xxx', Phone='123456778'); 
       insert a;
        System.assertEquals(null, [SELECT AccountNumber FROM Account WHERE Id = :a.Id].
                           AccountNumber);
        system.debug('XXXXXX' +a.AccountNumber +a.Name);                           

// Create a savepoint while AccountNumber is null
Savepoint sp = Database.setSavepoint();

// Change the account number
a.AccountNumber = '123';
update a;
System.assertEquals('123', [SELECT AccountNumber FROM Account WHERE Id = :a.Id].
                             AccountNumber);

// Rollback to the previous null value
Database.rollback(sp);
System.assertEquals(null, [SELECT AccountNumber FROM Account WHERE Id = :a.Id].
                            AccountNumber);
   }

}