public with sharing class AccountController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [SELECT Id,Name,Industry,Type, AnnualRevenue FROM Account WHERE Type != null AND Industry != null WITH SECURITY_ENFORCED LIMIT 10];
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountsByType(string type) {
        return [SELECT Id,Name,Industry,Type, AnnualRevenue FROM Account WHERE Type = :type WITH SECURITY_ENFORCED LIMIT 10];
    }
}

/* Apex kullanarak accountlari getirin ve ekrana yazdirin
   Wire Apex */