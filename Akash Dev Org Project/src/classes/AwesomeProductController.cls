public class AwesomeProductController {  
    @AuraEnabled
    public static List<akash007__CTSProduct__c> getProducts() {
        return [select id, name, photo__c, description__c, points__c from akash007__CTSProduct__c];
    }

    @AuraEnabled
    public static akash007__CTSProduct__c getProductByName(String name) {
        return [select id, name, photo__c, color__c,
                points__c, description__c,
                (select name from product_sizes__r order by name)
                from akash007__CTSProduct__c where name = :name];
    }
}