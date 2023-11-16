@isTest
public class Opportunity_Metadata_QueryTest {
	@isTest
    public static void testmetadata(){
        List<Discount_Rules__mdt> custommetadata =[SELECT id,Product_Validity__c,
                                                    Discount_Percentage__c,Product_Category__c FROM 
                                                    Discount_Rules__mdt where Product_Validity__c >=TODAY AND Product_Category__c!=null];
        
        List<Discount_Rules__mdt> li=Opportunity_Metadata_Query.queryRecords();
        System.assertEquals(li,custommetadata, 'It shoud be same list');
    }
}