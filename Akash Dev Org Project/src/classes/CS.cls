public class CS {
     
    public void check(){
    Map<String, Country__c> countries = Country__c.getAll();
        
     // Sort them by name
     List<String> countryNames = new List<String>();
     countryNames.addAll(countries.keySet());
     countryNames.sort();
     System.debug('---->'+countryNames );
    }
}