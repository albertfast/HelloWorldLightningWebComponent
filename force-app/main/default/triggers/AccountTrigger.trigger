trigger AccountTrigger on Account (before delete, after insert, after update) {
    if (Trigger.isAfter) {
        if(Trigger.isInsert){
            AccountHandler.afterInsert(Trigger.new);
        }
        if (Trigger.isUpdate) {
            AccountHandler.afterUpdate(Trigger.oldMap, Trigger.newMap);
        }
    }
    if (Trigger.isBefore) {
        if (Trigger.isDelete) {
            AccountHandler.beforeDelete(Trigger.oldMap);
        }        
    }
}