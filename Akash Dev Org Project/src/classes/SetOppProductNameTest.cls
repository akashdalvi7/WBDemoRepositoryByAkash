@isTest
private class SetOppProductNameTest{
        public static testMethod void AccountTest()
        {
            Test.startTest();
           
            Opportunity o = new Opportunity();
            o.Name = 'testOpportunity';
            o.CloseDate = date.parse('07/30/2015');
            o.StageName = 'Prospecting';
            o.OppProductName__c = '';
            insert o;
                      
            OppProduct__c prod1 = new  OppProduct__c (Name ='manoj', ProductType__c = o.id);
            insert prod1;
            
            OppProduct__c prod2 = new  OppProduct__c (Name ='akash', ProductType__c = o.id);
            insert prod2;
            
            prod1.Name = 'CTS';
            update prod1;
            update o;
            
            delete prod2;
            update o;
           
            OppProduct__c prod3 = new  OppProduct__c (Name ='TCS', ProductType__c = o.id);
            insert prod3;
            update o;
          
            delete prod1;
            delete prod3;
            o.OppProductName__c = '';
            update o;
            
            OppProduct__c prod4 = new  OppProduct__c (Name ='IBM', ProductType__c = o.id);
            insert prod4;
            update o;
            prod4.Name = ' ';
            update prod4;
            update o;
            Test.stopTest();
        }

}