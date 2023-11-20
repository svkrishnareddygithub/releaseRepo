@isTest
public class Account_Description_Test {
	    @isTest
    static void testDescriptionUpdate() {
        // Create a test account with a non-null Phone field
        Account testAccount = new Account(
            Name = 'Test Account',
            Phone = '123-456-7890'
        );
        insert testAccount;

        // Call the description_update method in the Account_Description_Handler class
        List<Account> accountsToUpdate = new List<Account>{testAccount};
        Account_Description_Handler.description_update(accountsToUpdate);

        // Retrieve the updated account from the database
        Account updatedAccount = [SELECT Id, Description FROM Account WHERE Id = :testAccount.Id];

        // Assert that the Description field has been updated with the Phone value
        System.assertEquals(testAccount.Phone, updatedAccount.Description, 'Description should be updated with Phone value');
    }

}