trigger testTrigger on Contact (before update) {
    if (Trigger.isBefore) {
        System.debug('********Trigger values***********');
        System.debug('***SFDC: Trigger.old is: ' + Trigger.old);
        System.debug('***SFDC: Trigger.new is: ' + Trigger.new);
    }
}