/**
 * @description display the discount based on the category using custom metadata type and custom settings
 */
public without sharing class OpportunityDiscount {
    /**
     * @description method as insertOrUpdationRecord
     * @return void
     * @param as list of opportunity
     */
    public static void insertOrUpdationRecord(List<Opportunity> opps){
        List<Discount_Rules__mdt> custommetadata =[SELECT id,Product_Validity__c,
                                                    Discount_Percentage__c,Product_Category__c FROM 
                                                   Discount_Rules__mdt where Product_Validity__c >=TODAY AND Product_Category__c!=null];
        
        Discount_Rule__c instance = Discount_Rule__c.getInstance(Userinfo.getProfileId());
        for(Opportunity o: opps){         
      		for(Discount_Rules__mdt md: custommetadata)
            {
                    if(o.Product_Category__c == md.Product_Category__c && instance.Discount__c!=null){
                        o.Discount__c=instance.Discount__c;
                    }
                    else if(o.Product_Category__c == md.Product_Category__c && md.Product_Category__c!=null){
                        o.Discount__c=md.Discount_Percentage__c;
                    }
        	}
        }
    }
}