/**
 * @description pass this list to OpportunityDiscount class method
 */
public class Opportunity_Metadata_Query {
    /**
     * @description method as queryRecords
     */
    public static List<Discount_Rules__mdt> queryRecords(){
		List<Discount_Rules__mdt> custommetadata =[SELECT id,Product_Validity__c,
                                                    Discount_Percentage__c,Product_Category__c FROM 
                                                    Discount_Rules__mdt where Product_Validity__c >=TODAY AND Product_Category__c!=null];
        return custommetadata;
    }
}