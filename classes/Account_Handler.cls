/**
 * @description if State is not null so you have to select district field as well.
 */
public with sharing class Account_Handler {
     /**
     * @description method as queryRecords
     * @param List<Account> accounts list of inserted or updated records
     */
    public static void updateOrInsertRecords(List<Account> accounts){
        for(Account a:accounts){
            if(a.States__c!=null){
                a.District__c.addError('Select District Value');
            }
        }
    }
}