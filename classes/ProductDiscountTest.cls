@isTest
public class ProductDiscountTest {
 @isTest
    static void testInsertOrUpdationRecordWithMetadata() {
        // Create a test opportunity
        Opportunity testOpp = new Opportunity(
            Name = 'Test Opportunity',
            StageName = 'Prospecting',
            CloseDate = Date.today(),
            Product_Category__c = 'Cloths'
        );
        insert testOpp;

        // Create a test Discount Rule custom metadata record
        Discount_Rules__mdt testDiscountRule = new Discount_Rules__mdt(
            MasterLabel = 'Test Rule',
            Product_Category__c = 'Cloths',
            Discount_Percentage__c = 30
        );
        

        // Call the method from the main class
        OpportunityDiscount.insertOrUpdationRecord(new List<Opportunity>{testOpp});

        // Verify that the Discount__c field is updated based on custom metadata
        System.assertEquals(30, testOpp.Discount__c, 'Discount percentage should be 30%');
    }

    @isTest
    static void testInsertOrUpdationRecordWithSetting() {
        // Create a test opportunity
        Opportunity testOpp = new Opportunity(
            Name = 'Test Opportunity',
            StageName = 'Prospecting',
            CloseDate = Date.today(),
            Product_Category__c = 'Cloths'
        );
        insert testOpp;

        // Create a test Discount Rule custom setting record
        Discount_Rule__c testDiscountSetting = new Discount_Rule__c(
            SetupOwnerId = UserInfo.getProfileId(),
            Discount__c = 80
        );
        insert testDiscountSetting;

        // Call the method from the main class
        OpportunityDiscount.insertOrUpdationRecord(new List<Opportunity>{testOpp});

        // Verify that the Discount__c field is updated based on custom setting
        System.assertEquals(80, testOpp.Discount__c, 'Discount percentage should be 80%');
    }
}