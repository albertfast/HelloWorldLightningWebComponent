public with sharing class OpportunityHandler {
   public static void afterInsert(List<Opportunity> newOpps) {
        Set<Id> accountIds = new Set<Id>();

        //iterate over new opps and collect parent accpounts
        for (Opportunity opp : newOpps) {
            if (opp.AccountId != null) {
                accountIds.add(opp.AccountId);
            }
        }

        //calculate total opps & total amounts
        updateAccounts(accountIds);
   }

   private static void updateAccounts(Set<Id> accountIds) {
        //Get the accounts along with children opps
        List<Account> accounts = [SELECT Id, Total_Amount__c, Total_Opps__c, 
                                 (SELECT Id, Amount FROM Opportunities) 
                                 FROM Account WHERE Id IN :accountIds];
        for (Account acc : accounts) {
            acc.Total_Opps__c= acc.Opportunities.size();
            Decimal total = 0;
            for (Opportunity opp : acc.Opportunities) {
                total += opp.Amount;
            }
            acc.Total_Amount__c = total;
        }     
        // update accounts
        if (!accounts.isEmpty()) {
            try {
                update accounts; 
            } catch (Exception ex) {
                //create a log
            }
        }                    
   }
}