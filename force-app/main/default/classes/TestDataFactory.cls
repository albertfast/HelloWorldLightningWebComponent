@isTest
public with sharing class TestDataFactory {
    public static List<Contact> createContacts(integer numCon){
        List<Contact> cons = new List<Contact>();
        for (Integer i = 1; i <= numCon; i++) {
            Contact con = new Contact(FirstName = 'Test Contact' + i,
                                      LastName = 'Contact Test' + i,
                                      Email = 'testcontact@con.com'+ i,
                                      Phone = '1238596587' + i,
                                      LeadSource = 'Web'+ i);
            cons.add(con);
        }
                
        return cons;
    }
}
