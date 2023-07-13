public class RestCalloutsMock implements HttpCalloutMock{
   public HttpResponse respond(HttpRequest request) {
     HttpResponse response = new HttpResponse();
     if (Request.getEndPoint() == Integration_Info__mdt.getInstance('GET_USERS').Endpoint__C && request.getMethod() == 'GET') {
      response.setStatus('OK');
      response.setStatusCode(200);
      response.setBody('[{"id":3096952,"name":"Chandradev Deshpande","email":"deshpande_chandradev@greenholt.test","gender":"male","status":"inactive"},{"id":3096951,"name":"Malati Menon","email":"malati_menon@gottlieb.example","gender":"female","status":"inactive"},{"id":3096949,"name":"Prof. Bela Bhattathiri","email":"bela_prof_bhattathiri@considine.test","gender":"male","status":"inactive"},{"id":3096947,"name":"Msgr. Vidhur Chaturvedi","email":"chaturvedi_msgr_vidhur@hartmann.example","gender":"female","status":"active"},{"id":3096946,"name":"Mangala Desai MD","email":"md_mangala_desai@maggio.test","gender":"male","status":"inactive"},{"id":3096945,"name":"Devi Chopra","email":"devi_chopra@okuneva-daniel.example","gender":"female","status":"active"},{"id":3096944,"name":"Vimal Chopra","email":"vimal_chopra@ortiz-romaguera.test","gender":"female","status":"inactive"},{"id":3096943,"name":"Chitramala Johar","email":"johar_chitramala@veum.test","gender":"female","status":"inactive"},{"id":3096941,"name":"Harit Tandon","email":"harit_tandon@runolfsson.test","gender":"female","status":"inactive"},{"id":3096937,"name":"Jagadisha Kaniyar","email":"kaniyar_jagadisha@simonis.example","gender":"female","status":"inactive"}]');
      return response;
     } else if(Request.getEndPoint() == Integration_Info__mdt.getInstance('GET_USERS').Endpoint__C && request.getMethod() == 'POST'){
      response.setStatus('Created');
      response.setStatusCode(201);
      response.setHeader('Accept', 'application/json');
      response.setHeader('Content-Type', 'application/json');
      response.setHeader('Authorization', 'Bearer ' + Integration_Info__mdt.getInstance('GET_USERS').AccessToken__c);
      response.setBody('{"id": 3096952,"name": "testFirstName testLastName","email": "test@email.com","gender": "male","status": "active"}');
      return response;
     }
     return null;
   }
}