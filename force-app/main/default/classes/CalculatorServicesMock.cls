public class CalculatorServicesMock implements WebServiceMock{
    public void doInvoke(Object stub, 
                         Object request, 
                         Map<String,Object> response, 
                         String endpoint, 
                         String soapAction, 
                         String requestName, 
                         String responseNS, 
                         String responseName, 
                         String responseType){
    calculatorServices.doMultiplyResponse response_x = new calculatorServices.doMultiplyResponse();
    response_x.return_x = 15;
    response.put('response_x', response_x);
  }
}