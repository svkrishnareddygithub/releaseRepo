/**
 * @description pass this list to OpportunityDiscount class method
 */
public without sharing class Opportunity_Metadata_Query {
    /**
     * @description method as queryRecords
     * @return List<Discount_Rules__mdt>
     */
    public static List<Discount_Rules__mdt> queryRecords(){
        // Make sure we can update the database before even trying
        if (Schema.sObjectType.Discount_Rules__mdt.isAccessible()) {
            return [SELECT id,Product_Validity__c,Discount_Percentage__c,Product_Category__c FROM Discount_Rules__mdt];
        }else{
            return new List<Discount_Rules__mdt>();
        }
    }
}