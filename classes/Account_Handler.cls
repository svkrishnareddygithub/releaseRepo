/**
 * @description if State is not null so you have to select district field as well.
 */
public with sharing class Account_Handler {
     /**
     * @description Method to insert or update records
     * @param accounts list of accounts
     */
    public static void updateOrInsertRecords(List<Account> accounts){
        for(Account a:accounts){
            if(a.States__c!=null){
                a.District__c.addError('Select District Value');
            }
        }
    }
}