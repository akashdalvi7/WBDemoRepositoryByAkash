public with sharing class TestDisplayQueryList{ 
public List<Account> Records {get; set;} 
public TestDisplayQueryList(){ 
Records = 
[select Name, AccountNumber, Phone from Account where Phone != null]; 
} 
}