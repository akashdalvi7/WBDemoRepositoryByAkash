trigger SetValideCountAndAmount on akash007__Purchase_History__c (after insert, after update) {
    List<Contact> ConId = new List<Contact>();
    for(Contact c: [select ID,akash007__CheckCorrectCount__c,akash007__CheckCorrectSum__c from Contact]){
                        ConId.add(c);      
    }
     if(trigger.isInsert){ 
               for(akash007__Purchase_History__c ph : trigger.new){
                       for(Contact var : ConId){       
                               if(var.Id == ph.akash007__ContactPurchaseHistory__c){         
                                         if(var.akash007__CheckCorrectCount__c == NULL && var.akash007__CheckCorrectSum__c == NULL){
                                               var.akash007__CheckCorrectCount__c = 0;
                                               var.akash007__CheckCorrectSum__c = 0;
                                               }
                                               if(System.today() - 30 <= ph.akash007__Date_of_purchase__c){
                                                    var.akash007__CheckCorrectCount__c += 1;
                                                    var.akash007__CheckCorrectSum__c = var.akash007__CheckCorrectSum__c + ph.akash007__Amount__c; 
                                                    var.akash007__CheckCorrectAvg__c = var.akash007__CheckCorrectSum__c / var.akash007__CheckCorrectCount__c;
                                               } 
                                               update var;
                                            }
                                      }
                                 }
                       
                            }

    
}