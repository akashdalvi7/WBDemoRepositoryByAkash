public class CSvalues{
    public void printCountry(){
    Map<String, Country__c> countries = Country__c.getAll();
    System.debug('--->'+countries);     
    }       
/*
     // Sort them by name
     List<String> countryNames = new List<String>();
     countryNames.addAll(countries.keySet());
     countryNames.sort();
     System.debug('---->'+countryNames );

    
    //Country__c cs = Country__c.getValues('USA');
    //System.debug('------->'+cs);
    */
   
 }