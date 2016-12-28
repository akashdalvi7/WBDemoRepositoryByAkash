trigger SetOppProductName on OppProduct__c (after insert, after update, after delete) {
    List<Opportunity> OpId = new List<Opportunity>();
    for(Opportunity o: [select ID,OppProductName__c from Opportunity]){
                        OpId.add(o);      
                        }
           if(trigger.isInsert){ 
               for(OppProduct__c op : trigger.new){
                       for(Opportunity var : OpId){       
                               if(var.Id == op.ProductType__c){         
                                         if(var.OppProductName__c == NULL){
                                               var.OppProductName__c = '';
                                               }
                                               var.OppProductName__c = var.OppProductName__c + op.Name;
                                               update var;
                                            }
                                      }
                                 }
                       
                            }
                            
            if(trigger.isUpdate){ 
                for(Oppproduct__c op1 : trigger.old){
               for(OppProduct__c op : trigger.new){
                       for(Opportunity var : OpId){       
                               if(var.Id == op.ProductType__c){         
                                         if(var.OppProductName__c == NULL){
                                               var.OppProductName__c = '';
                                               }
                                               if(op.Name != op1.Name){
                                               System.debug('Old value is ---> ' +op1.Name);
                                               System.debug('New value is ---> ' +op.Name);
                                               var.OppProductName__c = var.OppProductName__c.remove(op1.Name);
                                               var.OppProductName__c = var.OppProductName__c+op.Name;  
                                               update var;
                                               } 
                                            }
                                      }
                                 }
                       
                            }
                     }       
            if(trigger.isDelete){ 
                for(Oppproduct__c op1 : trigger.old){
                       for(Opportunity var : OpId){       
                               if(var.Id == op1.ProductType__c){         
                                       if(var.OppProductName__c == NULL){
                                               var.OppProductName__c = '';
                                               }
                                               var.OppProductName__c = var.OppProductName__c.remove(op1.Name);
                                               update var;
                                                
                                            }
                                      }
                                 }
                       
                            }
  }