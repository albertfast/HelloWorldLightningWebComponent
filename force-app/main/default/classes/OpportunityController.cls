public with sharing class OpportunityController {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunities(){
        return [SELECT Id,Name,Type,StageName, Amount FROM Opportunity WITH SECURITY_ENFORCED LIMIT 10];
        
    }

    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunitiesByStage(string stage){
        return [SELECT Id,Name,Type,StageName, Amount FROM Opportunity WHERE StageName = :stage WITH SECURITY_ENFORCED LIMIT 10];
        
    }
    
}