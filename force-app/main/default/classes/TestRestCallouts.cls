@isTest
public class TestRestCallouts {
    @isTest
    static void testGetUsers(){
        //RestCalloutsMock mock = new RestCalloutsMock();
        //Test.setMock(HttpCalloutMock.class, mock);

        Test.setMock(HttpCalloutMock.class, new RestCalloutsMock());
           HttpResponse response = RestCallouts.getUsers(); 

           Assert.isTrue(response.getStatusCode() == 200);
           Assert.isTrue(response.getStatus() == 'OK');

           Integer countContact = [SELECT count() FROM Contact];
           Assert.isTrue(countContact == 10);
    }
    @isTest
    static void testBearerAuth(){
        Test.setMock(HttpCalloutMock.class, new RestCalloutsMock());
        Contact con =new Contact();
        con.FirstName = 'testFirstName';
        con.LastName = 'testLastName';
        con.Email = 'test@email.com';
        con.gender__c = 'male';
        con.status__c = 'active';
        insert con;

        Test.startTest();
        HttpResponse response = RestCallouts.bearerAuth();
        Test.stopTest();

        Assert.isTrue(response.getStatusCode() == 201);
        Assert.isTrue(response.getStatus() == 'Created');

        string jsonString = response.getBody();
        Assert.isTrue(jsonString.contains(con.FirstName + ' ' + con.LastName) == true);
    }
}