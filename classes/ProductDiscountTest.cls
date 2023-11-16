@isTest
public class ProductDiscountTest {
 @isTest
    static void testInsertOrUpdationRecordWithMetadata() {
        // Create a test Discount Rule custom metadata record
        Discount_Rules__mdt testDiscountRule = new Discount_Rules__mdt(
            MasterLabel = 'Test Rule',
            Product_Category__c = 'Cloths',
            Discount_Percentage__c = 30
        );
        
        // Create a test opportunity
        Opportunity testOpp = new Opportunity(
            Name = 'Test Opportunity',
            StageName = 'Prospecting',
            CloseDate = Date.today(),
            Product_Category__c = 'Cloths'
            
        );
        insert testOpp;

        // Call the method from the main class
        OpportunityDiscount.insertOrUpdationRecord(new List<Opportunity>{testOpp});

        // Verify that the Discount__c field is updated based on custom metadata
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
            Product_Category__c = 'Cloths'
        );
        insert testOpp;


        // Call the method from the main class
        OpportunityDiscount.insertOrUpdationRecord(new List<Opportunity>{testOpp});

        // Verify that the Discount__c field is updated based on custom setting
        System.assertEquals(testOpp.Discount__c,80,  'Discount percentage should be 80%');
    }
}