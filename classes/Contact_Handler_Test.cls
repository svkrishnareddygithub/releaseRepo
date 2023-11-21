@isTest
public class Contact_Handler_Test {
	 @isTest
    static void testUpdateOrInsertRecords() {
        System.runAs(new User(id=UserInfo.getUserId())){
        Account testAccount1 = new Account(Name = 'Test Account 2');
        insert testAccount1;
        Contact c=new Contact(lastName='krishna',AccountId=testAccount1.Id,State__c='Telangana');
        Test.startTest();
        try {
            insert c; 
            System.assert(false, 'Expected an error but the operation succeeded.');
        } catch (DmlException e) {
            System.assertEquals('Select District Value', e.getDmlMessage(0), 'You should select district value');
        }
        Test.stopTest();
        }
    }
}