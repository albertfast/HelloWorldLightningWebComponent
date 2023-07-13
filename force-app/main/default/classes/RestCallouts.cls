public class RestCallouts {
  static final string HTTP_GET = 'GET';
  static final string HTTP_POST = 'POST';
  public static HttpResponse getAnimals() {
    //1.Requestin hazirlanmasi
    HttpRequest request = new HttpRequest();
    //remote site settings ten acces verilmeli
    request.setEndpoint(Integration_Info__mdt.getInstance('GET_ANIMALS').Endpoint__C); 
    request.setMethod(HTTP_GET);
    //2.Http Protokolu ile Requestin Gonderilmesi
    Http http = new Http();
    //2.1 Requestin gonderilmesi ve responsun alinmasi
    HttpResponse response = http.send(request);
    //3.Response sonrasi gerekli islemin yurutulmesi
    System.debug('Status: ' + response.getStatus());
    System.debug('Status Code:' + response.getStatusCode());
    if (response.getStatusCode() == 200) {
        //requestin basarili olmasi durumunda yurutulecek islem
        string jsonString = response.getBody();
        System.debug('JSON Type => ' +jsonString);
        Map<String,Object> results = (Map<String,Object>)Json.deserializeUntyped(jsonString);
        System.debug( 'My Map ==> ' + results);
        List<Object> animals = (List<Object>)results.get('animals');
        System.debug( 'Animal List ==> ' + animals);
        for (Object animal : animals) {
            System.debug(animal);
        }
    } else {
        //requestin basarisiz olmasi durumunda yurutulecek islem
        System.debug('Hata Mesaji ' + response.getStatus());
        System.debug('Hata Codu:' + response.getStatusCode());
    }
    return response;
  }
  // create contact
  public static HttpResponse getUsers(){
    //1.Requestin hazirlanmasi
    HttpRequest request = new HttpRequest();
    //remote site settings ten acces verilmeli ya da 
    request.setEndpoint(Integration_Info__mdt.getInstance('GET_USERS').Endpoint__C);
    request.setMethod(HTTP_GET);
    //2.Http Protokolu ile Requestin Gonderilmesi
    Http http = new Http();
    //2.1 Requestin gonderilmesi ve responsun alinmasi
    HttpResponse response = http.send(request);
    //3.Response sonrasi gerekli islemin yurutulmesi
    System.debug('Status: ' + response.getStatus());
    System.debug('Status Code:' + response.getStatusCode());
    if (response.getStatusCode() == 200) {
        //requestin basarili olmasi durumunda yurutulecek islem
        string jsonString = response.getBody();
        System.debug('JSON Type => ' +jsonString);
        List<ContactResponse> contactResponses = (List<ContactResponse>)JSON.deserialize(jsonString, List<ContactResponse>.class);
        System.debug(contactResponses);
        processContacts(contactResponses);
    } else {
        //requestin basarisiz olmasi durumunda yurutulecek islem
        System.debug('Hata Mesaji ' + response.getStatus());
        System.debug('Hata Code:' + response.getStatusCode());
    }
    return response;
  }
  private static void processContacts(List<ContactResponse> contactResponses){
    List<Contact> conList = new List<Contact>();
    for (ContactResponse cr : contactResponses) {
        Contact con = new Contact();
        String[] names = cr.name.split(' ');
        con.FirstName = names[0];
        con.LastName = names[1];
        con.Email = cr.email;
        con.gender__c = cr.gender;
        con.status__c = cr.status;
        conList.add(con);
    }
    if (!conList.isEmpty()) {
        insert conList;
    }
  }
  public static HttpResponse postAnimals() {
     //1.Requestin hazirlanmasi
     HttpRequest request = new HttpRequest();
     //remote site settings ten acces verilmeli ya da 
     request.setEndpoint(Integration_Info__mdt.getInstance('POST_ANIMALS').Endpoint__C); 
     request.setMethod(HTTP_POST);
     request.setHeader('Content-Type', 'application/json;charset=UTF-8');
     request.setBody('{"name" : "Panda"}');
     //2.Http Protokolu ile Requestin Gonderilmesi
     Http http = new Http();
     //2.1 Requestin gonderilmesi ve responsun alinmasi
     HttpResponse response = http.send(request);
     //3.Response sonrasi gerekli islemin yurutulmesi
     System.debug('Status: ' + response.getStatus());
     System.debug('Status Code:' + response.getStatusCode());
     if (response.getStatusCode() == 201) {
      //requestin basarili olmasi durumunda yurutulecek islem
      string jsonString = response.getBody();
      System.debug('JSON Type => ' +jsonString);
     } else {
      //requestin basarisiz olmasi durumunda yurutulecek islem
      System.debug('Hata Mesaji ' + response.getStatus());
      System.debug('Hata Code:' + response.getStatusCode());
  }
  return response;
  }
  public static HttpResponse postUsers(){
    //end point : https://reqres.in/api/users
    // body : {"name": "morpheus", "job": "leader"} 
     //1.Requestin hazirlanmasi
     HttpRequest request = new HttpRequest();
     //remote site settings ten acces verilmeli ya da 
     request.setEndpoint(Integration_Info__mdt.getInstance('POST_USERS').Endpoint__C);
     request.setMethod(HTTP_POST);
     request.setHeader('Content-Type', 'application/json;charset=UTF-8');
     request.setBody('{"name": "Ahmet", "job": "Developer"}');
     //2.Http Protokolu ile Requestin Gonderilmesi
     Http http = new Http();
     //2.1 Requestin gonderilmesi ve responsun alinmasi
     HttpResponse response = http.send(request);
     //3.Response sonrasi gerekli islemin yurutulmesi
     System.debug('Status: ' + response.getStatus());
     System.debug('Status Code:' + response.getStatusCode());
     if (response.getStatusCode() == 201) {
      //requestin basarili olmasi durumunda yurutulecek islem
      string jsonString = response.getBody();
      System.debug('JSON Type => ' +jsonString);
      Map<string,object> results = (Map<string,object>)JSON.deserializeUntyped(jsonString);
      System.debug(results);
      integer userId = integer.valueOf(results.get('id'));
      System.debug('User basari ile olusturuldu. User Id: ' + userId );
     } else {
      //requestin basarisiz olmasi durumunda yurutulecek islem
      System.debug('Hata Mesaji ' + response.getStatus());
      System.debug('Hata Code:' + response.getStatusCode());
  }
  return response;
  }
  public static HttpResponse basicAuth(){
    // https://postman-echo.com/basic-auth
    // Username: postman
    // Password: password

    //1.Requestin hazirlanmasi
      HttpRequest request = new HttpRequest();
      request.setEndpoint(Integration_Info__mdt.getInstance('BASIC_POSTMAN').Endpoint__C);
      request.setMethod(HTTP_GET);

      String userName = Integration_Info__mdt.getInstance('BASIC_POSTMAN').UserName__C;
      String password = Integration_Info__mdt.getInstance('BASIC_POSTMAN').Password__c;
      // cG9zdG1hbjpwYXNzd29yZA==
      String auth = EncodingUtil.base64Encode(Blob.valueOf(userName + ':' + password));
      System.debug(auth);

      request.setHeader('Authorization', 'Basic ' + auth);
    //2.Http Protokolu ile Requestin Gonderilmesi
      Http http = new Http();
    //2.1 Requestin gonderilmesi ve responsun alinmasi
      HttpResponse response = http.send(request);
    //3.Response sonrasi gerekli islemin yurutulmesi
      if (response.getStatusCode() == 200) {
          String jsonString = response.getBody();
          System.debug(jsonString);
      } else {
        //requestin basarisiz olmasi durumunda yurutulecek islem
        System.debug('Hata Mesaji ' + response.getStatus());
        System.debug('Hata Code:' + response.getStatusCode());
    }
    return response;
  }

public static HttpResponse bearerAuth() {
  // https://gorest.co.in/public/v2/users
  // Access token: 7a9b8dafb327aafd15beab1a0a272d61188cb766128984c43cdd8d4408817b89
  /* curl -i -H "Accept:application/json" -H "Content-Type:application/json" -H "Authorization: Bearer 7a9b8dafb327aafd15beab1a0a272d61188cb766128984c43cdd8d4408817b89" 
 -XPOST "https://gorest.co.in/public/v2/users" -d '{"name":"Tenali Ramakrishna", "gender":"male", "email":"tenali.ramakrishna@15ce.com", "status":"active"}' */
  
  //1.Requestin hazirlanmasi
  HttpRequest request = new HttpRequest();
  request.setEndpoint(Integration_Info__mdt.getInstance('GET_USERS').Endpoint__C);
  request.setMethod(HTTP_POST);
  request.setHeader('Accept', 'application/json');
  request.setHeader('Content-Type', 'application/json');
  request.setHeader('Authorization', 'Bearer ' + Integration_Info__mdt.getInstance('GET_USERS').AccessToken__c);

  Contact con = [SELECT FirstName, LastName, gender__c, Email, status__c FROM Contact 
                ORDER BY CreatedDate DESC LIMIT 1]; 
  
  ContactResponse cr = new ContactResponse();
  cr.name = con.FirstName + ' ' + con.LastName;
  cr.Email = con.Email;
  cr.gender = con.gender__c;
  cr.status= con.status__c;

  string jsonString = JSON.serialize(cr);
  System.debug(jsonString);
  request.setBody(jsonString);

  //2.Http Protokolu ile Requestin Gonderilmesi
  Http http = new Http();
  //2.1 Requestin gonderilmesi ve responsun alinmasi
  HttpResponse response = http.send(Request);
  //3.Response sonrasi gerekli islemin yurutulmesi
  if (response.getStatusCode() == 201) {
    //requestin basarili olmasi durumunda yurutulecek islem
    jsonString = response.getBody();
    ContactResponse conRes = (ContactResponse)JSON.deserialize(jsonString, ContactResponse.class);
    System.debug('User basari ile olusturuldu. User Id: ' + conRes.id );
    
   } else {
    //requestin basarisiz olmasi durumunda yurutulecek islem
    System.debug('Hata Mesaji ' + response.getStatus());
    System.debug('Hata Code:' + response.getStatusCode());
  }
  return response;
  }
}

