@isTest
public class Contact_DescriptionWithPhoneTest {
		    @isTest
    static void testDescriptionUpdate() {
        System.runAs(new User(id=UserInfo.getUserId())){
        // Create a test contact with a non-null Phone field
        Contact testContact = new Contact(
            FirstName = 'John',
            LastName = 'Doe',
            Phone = '123-456-7890'
        );
        insert testContact;

        // Call the descriptionUpdate method in the Contact_DescriptionWithPhone class
        List<Contact> contactsToUpdate = new List<Contact>{testContact};
        Contact_DescriptionWithPhone.descriptionUpdate(contactsToUpdate);

        // Retrieve the updated contact from the database
        Contact updatedContact = [SELECT Id, Description FROM Contact WHERE Id = :testContact.Id];

        // Assert that the Description field has been updated with the Phone value
        System.assertEquals(testContact.Phone, updatedContact.Description, 'Description should be updated with Phone value');
    }

    }
}