//Apex format
Account acc = [SELECT Id, Name, Type, Industry, AnnualRevenue
               FROM Account 
               WHERE Industry != null 
               AND AnnualRevenue != NULL 
               LIMIT 1];
System.debug(acc);
Account:{    
            Id = 001Dn00000Bxmp3IAB, 
            Name = GenePoint, 
            Type = Customer - Channel, 
            Industry = Biotechnology, 
            AnnualRevenue = 30000000
        }
//JSON format
{    
            "Id" : "001Dn00000Bxmp3IAB", 
            "Name" : "GenePoint", 
            "Type" : "Customer - Channel", 
            "Industry" : "Biotechnology", 
            "AnnualRevenue" : 30000000
}
//sObject record/recordlar JSON formata nasil donusturulur
//JSON Class methodlari arasinda bulunan serilaize methodlari ile
//JSON.serialize(objectToserialize)
//Return type : string
//Bir record
Account acc = [SELECT Id, Name, Type, Industry, AnnualRevenue
               FROM Account 
               WHERE Industry != null 
               AND AnnualRevenue != NULL 
               LIMIT 1];
String jsonString = JSON.serialize(acc);
System.debug(jsonString);

{"Id":"001Dn00000Bxmp3IAB",
"Name":"GenePoint",
"Type":"Customer - Channel","Industry":"Biotechnology","AnnualRevenue":30000000}
//birden fazla record
List<Account> acc = [SELECT Id, Name, Type, Industry, AnnualRevenue
               FROM Account 
               WHERE Industry != null 
               AND AnnualRevenue != NULL 
               LIMIT 3];

String jsonString = JSON.serialize(acc);
System.debug(jsonString);

[
    {
       
        "Id": "001Dn00000Bxmp3IAB",
        "Name": "GenePoint",
        "Type": "Customer - Channel",
        "Industry": "Biotechnology",
        "AnnualRevenue": 30000000
    },
    {
       
        "Id": "001Dn00000BxmotIAB",
        "Name": "Edge Communications",
        "Type": "Customer - Direct",
        "Industry": "Electronics",
        "AnnualRevenue": 139000000
    },
    {
        
        "Id": "001Dn00000BxmouIAB",
        "Name": "Burlington Textiles Corp of America",
        "Type": "Customer - Direct",
        "Industry": "Apparel",
        "AnnualRevenue": 350000000
    }
]

//JSON format sObject recordlara nasil donusturulur
//JSON Class methodlari arasinda bulunan deserialize methodlari ile
//JSON.deserialize(jsonString, apexType)
//Return type : donusturmek istedigimiz apexType

string jsonString = '{"Name":"Integrationa Giris","Type":"Customer - Channel","Industry":"Biotechnology","AnnualRevenue":30000000}';
Account acc = (Account)JSON.deserialize(jsonString, Account.Class);
System.debug(acc);
insert acc;

//XML format
<Account> 
    <Name>Integrationa Giris With XML </Name>
    <Type>Customer - Channel </Type>
    <Industry>Biotechnology</Industry>
    <AnnualRevenue>30000000 </AnnualRevenue>
</Account>

RestCallouts.getUsers();
RestCallouts.getAnimals();
RestCallouts.postAnimals();
RestCallouts.postUsers();
RestCallouts.bearerAuth();