@isTest
public class ParkServicesTest {
    @isTest
    static void getParksCountry() {
    ParkServiceMock mock = new ParkServiceMock();
    Test.setMock(WebServiceMock.class, mock);
    String[] parks = ParkCallout.getParksCountry('Turkey');
    Assert.isTrue(2 == parks.size());
    }
    

}