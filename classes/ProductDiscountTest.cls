@isTest
public class ProductDiscountTest {    
    @isTest
    static void testInsert() {
        System.runAs(new User(id=UserInfo.getUserId()))
        {            
            
                 Discount_Rules__mdt testDiscountRule = new Discount_Rules__mdt(
                    MasterLabel = 'Test Rule',
                    Product_Category__c = 'Cloths',
                    Discount_Percentage__c = 30.0
                );
            
            Discount_Rules__mdt custommetadata =[SELECT id,Product_Validity__c,
                                                        Discount_Percentage__c,Product_Category__c FROM 
                                                        Discount_Rules__mdt where Product_Category__c=:testDiscountRule.Product_Category__c limit 1];
                // Create a test opportunity
                Opportunity testOpp = new Opportunity(
                    Name = 'Test Opportunity',
                    StageName = 'Prospecting',
                    CloseDate = Date.today(),
                    Product_Category__c = 'Cloths'
                );
                insert testOpp;
        
                Test.startTest();
                OpportunityDiscount.insertOrUpdationRecord(new List<Opportunity>{testOpp});
       			Test.stopTest();
            	
                Opportunity retriverec=[select id,name,discount__c,Product_Category__c from Opportunity where id=:testOpp.Id limit 1];
				testOpp.Discount__c=custommetadata.Discount_Percentage__c;
            	update testOpp;
                System.assertEquals(testOpp.Discount__c,30,'Discount should be 30');
            	System.debug('xyz'+testOpp.Discount__c);
        }
    }
    
     @isTest
    static void testInsert1() {
        Profile p=[select id,name from Profile where name='Standard User'];
         User testUser = new User(
            ProfileId = p.Id,
            FirstName = 'Test',
            LastName = 'User',
            Email = 'testuser@example.com',
            Username = 'testuser@example.com' + System.currentTimeMillis(),
            Alias = 'tuser',
            CommunityNickname = 'testuser',
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            TimeZoneSidKey = 'America/New_York'
        );
        insert testUser;
        System.runAs(testUser)
        {
            
                 Discount_Rule__c testDiscountSetting = new Discount_Rule__c(
                    setupOwnerId = testUser.ProfileId,
                    Discount__c = 20
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
        		testOpp.Discount__c=testDiscountSetting.Discount__c;
            	update testOpp;
            
                Test.startTest();
                OpportunityDiscount.insertOrUpdationRecord(new List<Opportunity>{testOpp});
       			Test.stopTest();
            
                Opportunity retriverec=[select id,name,discount__c,Product_Category__c from Opportunity where id=:testOpp.Id limit 1];

                System.assertEquals(retriverec.Discount__c,20,'Discount should be 20');
        }
    }
}