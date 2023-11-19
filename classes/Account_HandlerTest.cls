@isTest
private class Account_HandlerTest {
    @isTest
    static void testUpdateOrInsertRecords() {
        Account testAccount1 = new Account(Name = 'Test Account 2', States__c = 'Telangana');
        Test.startTest();
        try {
            insert testAccount1;
            System.assert(false, 'Expected an error but the operation succeeded.');
        } catch (DmlException e) {
            System.assertEquals('Select District Value', e.getDmlMessage(0));
        }
        Test.stopTest();
    }
}