trigger CheckOldNewValues on Account (before update, after update, before insert, after insert) {
    if (Trigger.isBefore) {
        System.debug('********Trigger values***********');
        System.debug('***SFDC: Trigger.old is: ' + Trigger.old);
        System.debug('***SFDC: Trigger.new is: ' + Trigger.new);
    }
    
    if (Trigger.isAfter) {
        System.debug('********Trigger values***********');    
        System.debug('***SFDC: Trigger.old is: ' + Trigger.old);
        System.debug('***SFDC: Trigger.new is: ' + Trigger.new);
       
    }
}