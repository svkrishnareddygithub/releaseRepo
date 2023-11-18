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
        List<Opportunity> categoryRecords=new List<Opportunity>();
        for(Opportunity o: opps){
            if(o.Product_Category__c!=null){
                categoryRecords.add(o);
            }
        }
        
        for(Opportunity o: categoryRecords)
        {  
            Decimal disountpercentage=0;
            {
                for(Discount_Rules__mdt md: custommetadata)
                {
                    if(o.Product_Category__c==md.Product_Category__c)
                    {
                        disountpercentage+=md.Discount_Percentage__c;
                        o.Discount__c=disountpercentage;
                    }	
                }
            }
            o.Discount__c=disountpercentage;
    	}
        
        Discount_Rule_Setting__c instance = Discount_Rule_Setting__c.getValues('Add 7 Percentage');
        
        for(Opportunity o:categoryRecords)
        {
            if(o.Discount__c>30.0 && instance!=null && instance.discount__c!=null){
                o.Discount__c+=instance.Discount__c;
            }else if(o.Discount__c<30.0){
                o.Discount__c=o.Discount__c;
            }
        }
   }
}