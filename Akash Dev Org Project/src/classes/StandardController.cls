public with sharing class StandardController {
    public ApexPages.StandardController standardController { get; set; }
    public StandardController(ApexPages.StandardController standardController) {
        this.standardController = standardController;
    }
}