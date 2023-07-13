@RestResource(urlMapping='/ContactManager/*')
global with sharing class ContactCustomAPI {
    //URL      = https://myplayground5-dev-ed.develop.lightning.force.com/lightning/page/home
    //Protokol = https://
    //Domain   = myplayground5-dev-ed.develop.lightning.force.com
    //Path     = /lightning/page/home

    //Protokol       = https://
    //Domain         = yourDomainName.my.salesforce.com
    //Path           = /services/apexrest
    //Custom Path    = /ContactManager/
    //Joker Karakter = *

    //URL            = https://myplayground5-dev-ed.my.salesforce.com/services/apexrest/ContactManager/*

  /*  @HttpGet
    global static List<Contact> getRecords(){
        //URL = https://myplayground5-dev-ed.my.salesforce.com/services/apexrest/ContactManager/Id1,Id2,Id3
        RestRequest request = RestContext.request;  
    //  string url = 'https://myplayground5-dev-ed.my.salesforce.com/services/apexrest/ContactManager/Id1,Id2,Id3';
        string url = request.requestURI;
        List<String> splitList = url.split('/');   
        System.debug(splitList);
        List<String> idList = splitList[splitList.size()-1].split(',');
        System.debug(idList);

        return [SELECT Id, FirstName, LastName, Email, Phone, LeadSource FROM Contact WHERE Id IN : idList];
    } */

    @HttpGet
    global static List<Contact> getRecords2(){
         //URL = https://myplayground5-dev-ed.my.salesforce.com/services/apexrest/ContactManager/Id1,Id2,Id3
         //Parametre = ?
         //Birden fazla parametre alacaksa "&" ifadesi ile ayrilir.
         //  https://myplayground5-dev-ed.my.salesforce.com/services/apexrest/ContactManager/?Name=Ali&LeadSource=Web
         RestRequest request = RestContext.request;
         Map<String,String> paramMap = request.params;
         String conName = paramMap.get('Name');
         conName = '%' + conName + '%';
         String conLeadSource = paramMap.get('LeadSource');

         return [SELECT Id, FirstName, LastName, Email, Phone, LeadSource FROM Contact WHERE (FirstName LIKE : conName OR LastName LIKE : conName) AND LeadSource =: conLeadSource ];
    }
/*
    @HttpPost
    global static string createRecord(string conFirstName, string conLastName, string conEmail, string conPhone){
        Contact con = new Contact();
        con.FirstName = conFirstName;
        con.LastName = conLastName;
        con.Email = conEmail;
        con.Phone = conPhone;
        insert con;
        RestContext.response.statusCode = 201;
        return 'Contact basari ile olusturuldu. ID: ' + con.Id; */
/*
{    
  "conFirstName" : "Workbench Post", 
  "conLastName" : "Create Record", 
  "conEmail" : "Workbenchpost@Post.com", 
  "conPhone" : "6285898785" 
  
}  
    
    } 
   @HttpPost
    global static string createRecord(Contact con){
        insert con;
        RestContext.response.statusCode = 201;
        return 'Contact basari ile olusturuldu. ID: ' + con.Id;

// { 
    "con" : {   
              "FirstName" : "Workbench Cool Post", 
              "LastName" : "Create Second Record", 
              "Email" : "CoolWorkbenchpost@Post.com", 
              "Phone" : "6285498785" 
            }
}  //
     
    }
     */

    @HttpPost
    global static string createRecord (List<Contact> cons) {
        Database.SaveResult[] results = Database.Insert(cons, false);
        RestContext.response.statusCode = 201;
        return JSON.serialize(results);
/*
{ 
    "cons" : [
            {   
              "FirstName" : "Workbench Cool Post 4", 
              "LastName" : "Create Second Record", 
              "Email" : "CoolWork45benchpost@Post.com", 
              "Phone" : "62854987859" 
            },
            {   
              "FirstName" : "Workbench Cool Post 5", 
              "LastName" : "Create Second Record", 
              "Email" : "CoolWorkbenchpo52st@Post.com", 
              "Phone" : "628548785" 
            },
            {   
              "FirstName" : "Workbench Cool Post 5", 
              "LastName" : "Create Second Record", 
              "Email" : "CoolWorkbenchpo52st@Post.com", 
              "Phone" : "628548785" 
            }
            ]
}  
     
    }

    @HttpDelete
    global static string deleteRecords(){
        //URL = https://myplayground5-dev-ed.my.salesforce.com/services/apexrest/ContactManager/Id1
        RestRequest request = RestContext.request;
        String url = request.requestURI;
       // String url = 'https://myplayground5-dev-ed.my.salesforce.com/services/apexrest/ContactManager/Id1';
        Integer idStartIndex = url.lastIndexOf('/')+1;
        String contactId = url.substring(idStartIndex);
        System.debug(contactId);

        Contact con = new Contact(Id = contactId);
        delete con;

        return 'Contact basari ile silindi. Con Id: ' + con.Id + 'Contact Name is: ' + con.FirstName;

    }  */}
    @HttpDelete
    global static string deleteRecords(){
        //URL = https://myplayground5-dev-ed.my.salesforce.com/services/apexrest/ContactManager/Id1,Id2,Id3
        RestRequest request = RestContext.request;
        String url = request.requestURI;
       // String url = 'https://myplayground5-dev-ed.my.salesforce.com/services/apexrest/ContactManager/Id1';
        Integer idStartIndex = url.lastIndexOf('/')+1;
        String contactId = url.substring(idStartIndex);
        List<String> conIds = contactId.split(',');

        List<Contact> contacts = [SELECT Id FROM Contact WHERE Id IN : conIds];
        Database.DeleteResult[] results = Database.delete(contacts, false);

        return JSON.serialize(results);

    } 
  /*
    @HttpPatch
    global static string updateRecord(string conFirstName, string conLastName, string conEmail, string conPhone ){
      // URL = https://myplayground5-dev-ed.my.salesforce.com/services/apexrest/ContactManager/Id1 
      RestRequest request = RestContext.request;
        String url = request.requestURI;
        Integer idStartIndex = url.lastIndexOf('/')+1;
        String contactId = url.substring(idStartIndex);
        List<String> conIds = contactId.split(',');

        Contact con = new Contact();
        con.Id = contactId;
        con.FirstName = conFirstName;
        con.LastName = conLastName;
        con.Email = conEmail;
        con.Phone = conPhone;

        update con;

        return con.Id + ' ID\'li contact basari ile update edildi.';

        
       // {    
       //   "conFirstName" : "Workbench Patch", 
       //   "conLastName" : "Update Record", 
       //   "conEmail" : "Workbenchpatch@Patch.com", 
       //   "conPhone" : "01012112" 
       // }  
        
    }  */   

    @HttpPatch
    global static string updateRecords(List<Contact> cons){
      Database.SaveResult[] results = Database.update(cons, false);
      return JSON.serialize(results);

      /*
{ 
   "cons" : [
            {  
              
              "Id" : "",
              "FirstName" : "Workbench Cool Patch 2", 
              "LastName" : "Create Second Record", 
              "Email" : "CoolWork45benchpost@Post.com", 
              "Phone" : "62854987859" 
            },
            {   
              "Id" : "",
              "FirstName" : "Workbench Cool Post 5", 
              "LastName" : "Create Second Record", 
              "Email" : "CoolWorkbenchpo52st@Post.com", 
              "Phone" : "628548785" 
            },
        
         ]
}  */
    }
    
    @HttpPut
    global static string upsertRecord(){
      RestRequest request = RestContext.request;
      string requestBody = request.requestBody.toString(); // Blob type'dan stringe donusturme.
      Contact con = (Contact)JSON.deserialize(requestBody, Contact.class);
      string returnString;
      if (con.Id == null) {
        returnString = 'Contact basari ile olusturuldu. ID: ';
      } else {
        returnString = 'Contact basari ile update edildi. ID: ';
      }
      upsert con;

      return returnString + con.Id;

     
     // {   
     //         "Id" : "003Dn00000OuQeyIAF",
     //         "FirstName" : "Workbench ol Patch 3", 
     //         "LastName" : "Create ond Record", 
     //         "Email" : "CoolWorkbenchpo2st@Post.com", 
     //         "Phone" : "625458548785" 
    //  } 
    } 
    /*
    @HttpPut
    global static string upsertRecords(List<Contact> cons){
      Database.UpsertResult[] results = Database.upsert(cons, false);
      return JSON.serialize(results);
    } */
}