@isTest
public class AccountInsertionTest {

    @isTest
    static void testInsertAccount() {
        // Create a new AccountInsertion instance
        AccountInsertion accountInsertion = new AccountInsertion();

        // Start the test by inserting an Account
        Test.startTest();
        accountInsertion.insertAccount();
        Test.stopTest();

        // Query the inserted Account to verify it exists
        Account insertedAccount = [SELECT Id, Name, Phone, Industry FROM Account WHERE Name = 'Sample Account' LIMIT 1];

        // Assert that the Account was inserted correctly
        System.assertEquals('Sample Account', insertedAccount.Name);
        System.assertEquals('123-456-7890', insertedAccount.Phone);
        System.assertEquals('Technology', insertedAccount.Industry);
    }
} 
