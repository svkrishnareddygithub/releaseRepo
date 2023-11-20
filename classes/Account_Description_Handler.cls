/**
 * @description if industry is not equals to null so update the descripton with industry value.
 */
public without sharing class Account_Description_Handler {
    /**
     * @description Method to insert or update records
     * @param accounts list of accounts
     */
    Public static void descriptionUpdate(List<Account> accounts){
        for(Account a:accounts){
            if(a.Phone!=null){
                a.description=a.Phone;
            }
        }
    }
}