public with sharing class CommandLinkParamController {

    // an instance variable for the standard controller
    private ApexPages.StandardController controller {get; set;}
     // the object being referenced via url
    private Contact contact {get;set;}
    // the variable being set from the commandlink
    public Boolean nickName {get; set;}

    // initialize the controller
    public CommandLinkParamController(ApexPages.StandardController controller) {

        //initialize the stanrdard controller
        this.controller = controller;
        // load the current record
        this.contact = (Contact)controller.getRecord();
        nickName = false; 

    }

    // handle the action of the commandlink
    public PageReference processLinkClick() {
        System.debug('nickName ---> : '+nickName);
        // now process the variable by doing something...
        return null;
    }

}