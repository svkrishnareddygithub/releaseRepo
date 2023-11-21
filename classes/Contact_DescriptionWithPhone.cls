/**
 * @description if industry is not equals to null so update the descripton with phone value.
 */
public without sharing class Contact_DescriptionWithPhone {
    /**
     * @description Method to insert or update records
     * @param contacts list of contacts
     */
    Public static void descriptionUpdate(List<Contact> contacts){
        for(Contact a:contacts){
            if(a.Phone!=null){
                a.description=a.Phone;
            }
        }
    }
}