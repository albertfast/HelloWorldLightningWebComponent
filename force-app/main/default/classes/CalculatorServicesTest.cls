@isTest
public class CalculatorServicesTest {
   @isTest
   static void doMultiplyTest(){
    Test.startTest();
    CalculatorServicesMock cs = new CalculatorServicesMock();
    Test.setMock(WebServiceMock.class, cs);
    Double result = CalculatorCallout.multiplaction(5, 3);
    Test.stopTest();
    Assert.isTrue(15 == result);
   }
}