/**
 * @description pass this list to OpportunityDiscount class method
 */
public without sharing class Opportunity_Metadata_Query {
    /**
     * @description method as queryRecords
     * @return List<Discount_Rules__mdt>
     */
    public static List<Discount_Rules__mdt> queryRecords(){
            return [SELECT id,Product_Validity__c,Discount_Percentage__c,Product_Category__c FROM Discount_Rules__mdt];
    }
}