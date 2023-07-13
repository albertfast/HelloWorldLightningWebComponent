trigger OpportunityTrigger on Opportunity (after insert) {
    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            OpportunityHandler.afterInsert(Trigger.new);
        }
    }
}