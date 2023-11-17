@isTest
public class UtilityClassTest {
  @isTest
    static void testDiscountRulesMdtStub() {
        // Instantiate the StubProviderImpl class
        UtilityClass stubProvider = new UtilityClass();

        // Simulate a call to handleMethodCall for Discount_Rules__mdt
        Discount_Rules__mdt simulatedRecord = (Discount_Rules__mdt)stubProvider.handleMethodCall(
            new Discount_Rules__mdt(),
            '',
            Discount_Rules__mdt.class,
            new List<Type>{ Discount_Rules__mdt.class },
            new List<String>(),
            new List<Object>()
        );

        // Verify that the simulated Discount_Rules__mdt record has the expected values
        System.assertEquals('Cloths', simulatedRecord.Product_Category__c, 'Product Category should be Cloths');
        System.assertEquals(20.0, simulatedRecord.Discount_Percentage__c, 'Discount Percentage should be 20.0');
    }

    @isTest
    static void testDiscountRuleCStub() {
        // Instantiate the StubProviderImpl class
        UtilityClass stubProvider = new UtilityClass();

        // Simulate a call to handleMethodCall for Discount_Rule__c
        Discount_Rule__c simulatedRecord = (Discount_Rule__c)stubProvider.handleMethodCall(
            new Discount_Rule__c(),
            '',
            Discount_Rule__c.class,
            new List<Type>{ Discount_Rule__c.class },
            new List<String>(),
            new List<Object>()
        );

        // Verify that the simulated Discount_Rule__c record has the expected values
        System.assertEquals(20.0, simulatedRecord.Discount__c, 'Discount should be 20.0');
    }
}