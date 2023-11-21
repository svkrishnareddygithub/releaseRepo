/**
 * @description if State is not null so you have to select district field as well.
 */
public without sharing class Contact_Handler {
     /**
     * @description Method to insert or update records
     * @param contacts list of contacts
     */
    public static void updateOrInsertRecords(List<Contact> contacts){
        for(Contact a:contacts){
            if(a.State__c != null){
                if(a.District__c==null){
                a.District__c.addError('Select District Value');
                }
            }
        }
    }
}