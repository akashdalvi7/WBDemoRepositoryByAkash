public with sharing class CustomSettingsListController {

  public String selectedCode {get;set;}

  public List<selectOption> countryCodes {
    get {
      List<selectOption> options = new List<selectOption>();

      for (Country__c c : Country__c.getAll().values())
        options.add(new SelectOption(c.Country_Code__c,c.Name+' - '+c.Country_Code__c));
      return options;

    }
    set;
  }

}