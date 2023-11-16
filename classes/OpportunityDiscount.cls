/**
 * @description display the discount based on the category using custom metadata type and custom settings
 */
public without sharing class OpportunityDiscount {
    /**
     * @description insertOrUpdationRecord and passing the parameter as list of opportunity
     */
    public static void insertOrUpdationRecord(List<Opportunity> opps){
        for(Opportunity o: opps){
            Discount_Rules__mdt serviceMetadat =[SELECT id,Product_Validity__c,
                                                    Discount_Percentage__c FROM Discount_Rules__mdt
                                                    WHERE Product_Category__c=:o.Product_Category__c AND Product_Validity__c >=TODAY limit 1];

            Discount_Rule__c instance = Discount_Rule__c.getInstance(Userinfo.getProfileId());
      
            if(serviceMetadat!=null && instance.Discount__c!=null){
                o.Discount__c=instance.Discount__c;
                 //System.debug('Instance Discount'+o.Discount__c);
       		}
            else if(serviceMetadat!=null){
                o.Discount__c=serviceMetadat.Discount_Percentage__c;
                //System.debug('MetadataDiscount'+o.Discount__c);
            }
        }
    }
}