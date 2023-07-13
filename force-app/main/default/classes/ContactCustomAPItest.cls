
@isTest
public with sharing class ContactCustomAPItest {
   @isTest
   static void getRecords2test(){
    insert TestDataFactory.createContacts(100);
    // 1. RestRequest --> Requestin Hazirlanmasi.
    RestRequest request = new RestRequest();
    request.httpMethod = 'Get';
    request.requestURI = 'https://myplayground5-dev-ed.my.salesforce.com/services/apexrest/ContactManager/?Name=ntac&LeadSource=Web' ;
    request.addParameter('Name', 'ntac');
    request.addParameter('LeadSource', 'Web');
    // 2. RestContext.request --> Hazirlanan Requestin Iletilmesi.
    RestContext.request = request;
    // 3. Test edilecek methodun cagirilmasi
    Test.startTest();
    List<Contact> cons = ContactCustomAPI.getRecords2();
    Test.stopTest();

    // 4. Assertion islemi
    Assert.isTrue(cons.size() == 0);
   }

   @IsTest
   static void createRecordTest(){
     RestResponse response = new RestResponse();
     RestContext.response = response;
     List<Contact> cons = TestDataFactory.createContacts(50);

      Test.startTest();
      ContactCustomAPI.createRecord(cons);
      Test.stopTest();
      
      Integer countContact = [SELECT COUNT() FROM Contact];
      Assert.isTrue(countContact == 50);
   }

   @IsTest
   static void deleteRecordsTest(){ 
       List<Contact> cons = TestDataFactory.createContacts(100);
       insert cons;
       // 1. RestRequest --> Requestin Hazirlanmasi.
       RestRequest request = new RestRequest();
       request.httpMethod = 'Delete';
       request.requestURI = 'https://myplayground5-dev-ed.my.salesforce.com/services/apexrest/ContactManager/' + cons[0].id + ',' + cons[1].id + ',' + cons[2].id;
      
       // 2. RestContext.request --> Hazirlanan Requestin Iletilmesi.
       RestContext.request = request;
       // 3. Test edilecek methodun cagirilmasi
       Test.startTest();
      ContactCustomAPI.deleteRecords();
       Test.stopTest();
   
       // 4. Assertion islemi
      Integer countContact = [SELECT COUNT() FROM Contact];
      Assert.isTrue(countContact == 97);
      }

      @isTest
      static void updateRecordTest(){ 
         List<Contact> cons = TestDataFactory.createContacts(100);
         insert cons;
         // 1. RestRequest --> Requestin Hazirlanmasi.
         RestRequest request = new RestRequest();
         request.httpMethod = 'Patch';
         request.requestURI = 'https://myplayground5-dev-ed.my.salesforce.com/services/apexrest/ContactManager/' + cons[65].id;
         // 2. RestContext.request --> Hazirlanan Requestin Iletilmesi.
         RestContext.request = request;
         // 3. Test edilecek methodun cagirilmasi
         Test.startTest();
         ContactCustomAPI.updateRecords(cons);
         Test.stopTest();
     
         // 4. Assertion islemi
         cons = [SELECT id FROM Contact WHERE FirstName = 'Ali'];
        // Assert.isTrue(cons.size() == 1);
        System.assertEquals(1, cons.size());
      }

      @IsTest
      static void upsertRecordTest(){ 
          List<Contact> cons = TestDataFactory.createContacts(100);
          insert cons;
          // 1. RestRequest --> Requestin Hazirlanmasi.
          RestRequest request = new RestRequest();
          request.httpMethod = 'Put';
          request.requestURI = 'https://myplayground5-dev-ed.my.salesforce.com/services/apexrest/ContactManager/';
          string requestBody = '{"Id" : "' + cons[45].Id + '","FirstName" : "PutUpdate","LastName" : "UpsertTest","Email" : "putUpsertTest@test.com", "Phone" : "652258548785" }';
          request.requestBody = Blob.valueOf(requestBody);
          // 2. RestContext.request --> Hazirlanan Requestin Iletilmesi.
          RestContext.request = request;
          // 3. Test edilecek methodun cagirilmasi
          
         ContactCustomAPI.upsertRecord();
         
      
          // 4. Assertion islemi
          Integer countContact = [SELECT COUNT() FROM Contact];
          cons = [SELECT id FROM Contact WHERE FirstName = 'PutUpdate'];
          Assert.isTrue(countContact == 1);
      }
   }



   