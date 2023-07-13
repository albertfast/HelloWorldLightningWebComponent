/*When an opportunity close date is approaching (< today+2) but its stage is still open, then create a
reminder task for the opportunity owner. The process should run everyday at 5AM */

public with sharing class OpportunityReminder implements Schedulable{
    public void execute(SchedulableContext sc) {
        List<Task> tasks = new List<Task>(); 
        Date todayPlus2 = Date.today().addDays(2);
        //identify the target records and create a task for each
        for(Opportunity opp : [SELECT Id, OwnerId FROM Opportunity WHERE CloseDate <= :todayPlus2 
                               AND StageName NOT IN ('Closed Won' , 'Closed Lost')]){
            Task tsk = new Task();
            tsk.Subject = 'Reminder: Opp close date is approaching';
            tsk.ActivityDate = Date.today();
            tsk.OwnerId = opp.OwnerId;
            tsk.WhatId = opp.Id;
            tasks.add(tsk);
        }

        //insert task
        try{
            if(!tasks.isEmpty()){
                insert tasks;
            }
        } catch(Exception ex) {
            // create log
            System.debug(ex.getMessage());
        }

        }

    }
