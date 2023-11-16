@isTest
public class ProductDiscountTest {
 @isTest
    static void testInsertOrUpdationRecordWithMetadata() {
        // Create a test Discount Rule custom metadata record
        Discount_Rules__mdt custommetadata =[SELECT id,Product_Validity__c,
                                                        Discount_Percentage__c,Product_Category__c FROM 
                                                        Discount_Rules__mdt where Product_Validity__c >=TODAY AND Product_Category__c='Cloths' limit 1];
        
        // Create a test opportunity
        Opportunity testOpp = new Opportunity(
            Name = 'Test Opportunity',
            StageName = 'Prospecting',
            CloseDate = Date.today(),
            Product_Category__c = 'Cloths',
            Discount__c=custommetadata.Discount_Percentage__c
        );
        insert testOpp;

        // Verify that the Discount__c field is updated based on custom metadata
        System.assertEquals(testOpp.Discount__c,30, 'Discount percentage should be 30%');
        testOpp.CloseDate = Date.today()+1;
        update  testOpp;
        System.assertEquals(testOpp.Discount__c,30, 'Discount percentage should be 30%');
    }

    @isTest
    static void testInsertOrUpdationRecordWithSetting() {
        
         // Create a test Discount Rule custom setting record
        Discount_Rule__c testDiscountSetting = new Discount_Rule__c(
            SetupOwnerId = UserInfo.getProfileId(),
            Discount__c = 80
        );
        insert testDiscountSetting;
        // Create a test opportunity
        Opportunity testOpp = new Opportunity(
            Name = 'Test Opportunity',
            StageName = 'Prospecting',
            CloseDate = Date.today(),
            Product_Category__c = 'Cloths',
            Discount__c=testDiscountSetting.Discount__c
        );
        insert testOpp;

        // Verify that the Discount__c field is updated based on custom setting
        System.assertEquals(testOpp.Discount__c,80,  'Discount percentage should be 80%');
        testOpp.CloseDate = Date.today()+1;
        update  testOpp;
        System.assertEquals(testOpp.Discount__c,80, 'Discount percentage should be 80%');
    }
}