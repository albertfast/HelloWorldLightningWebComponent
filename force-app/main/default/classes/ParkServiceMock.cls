public class ParkServiceMock implements WebServiceMock {
   public void doInvoke(Object stub, 
                        Object request, 
                        Map<String,Object> response, 
                        String endpoint, 
                        String soapAction, 
                        String requestName, 
                        String responseNS, 
                        String responseName, 
                        String responseType){
    parksServices.byCountryResponse response_x = new parksServices.byCountryResponse();
    response_x.return_x = new List<String>{'My Park 1' , 'My Park 2'};
    response.put('response_x', response_x);      
   }
   
}