/**
 * @description Display the discount based on the category using custom metadata type and custom settings
 */
public without sharing class OpportunityDiscount {
    
    /**
     * @description Method to insert or update records
     * @param opps List of Opportunities
     */
    public static void insertOrUpdationRecord(List<Opportunity> opps) {
        List<Discount_Rules__mdt> custommetadata = Opportunity_Metadata_Query.queryRecords();
        List<Opportunity> categoryRecords = new List<Opportunity>();
        
        for (Opportunity o : opps) {
            if (o.Product_Category__c != null) {
                categoryRecords.add(o);
            }
        }
        
        calculateDiscounts(categoryRecords, custommetadata);
        
        applyAdditionalDiscounts(categoryRecords);
    }

    /**
     * @description Calculate discounts based on custom metadata
     * @param categoryRecords List of Opportunities
     * @param custommetadata List of Discount Rules
     */
    private static void calculateDiscounts(List<Opportunity> categoryRecords, List<Discount_Rules__mdt> custommetadata) {
        for (Opportunity o : categoryRecords) {
            Decimal discountPercentage = 0;
            for (Discount_Rules__mdt md : custommetadata) {
                if (o.Product_Category__c == md.Product_Category__c) {
                    discountPercentage += md.Discount_Percentage__c;
                }
            }
            o.Discount__c = discountPercentage;
        }
    }

    /**
     * @description Apply additional discounts based on custom settings
     * @param categoryRecords List of Opportunities
     */
    private static void applyAdditionalDiscounts(List<Opportunity> categoryRecords) {
        Discount_Rule_Setting__c instance = Discount_Rule_Setting__c.getValues('Add 7 Percentage');
        
        for (Opportunity o : categoryRecords) {
            if (o.Discount__c > 30.0 && instance != null && instance.discount__c != null) {
                o.Discount__c += instance.Discount__c;
            }
        }
    }
}