/**
 * @description display the discount based on the category using custom metadata type and custom settings
 */
public without sharing class OpportunityDiscount {
    /**
     * @description method as insertOrUpdationRecord
     * @param opps
     */
    public static void insertOrUpdationRecord(List<Opportunity> opps){
        //fetching custom metadata records
        List<Discount_Rules__mdt> custommetadata =Opportunity_Metadata_Query.queryRecords();
        //custom setting instance passing the profileId and getting the discount value
        Discount_Rule__c instance = Discount_Rule__c.getInstance(Userinfo.getProfileId());
        for(Opportunity o: opps){         
      		for(Discount_Rules__mdt md: custommetadata)
            {
                if(o.Product_Category__c == md.Product_Category__c){
                        
                    if(instance.Discount__c==null){
                        
                        o.Discount__c=md.Discount_Percentage__c;
                    }
                    else{
                    	o.Discount__c=instance.Discount__c;
                    }
        		}
        	}
    	}
   }
}