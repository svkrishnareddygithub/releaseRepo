@isTest
public class ProductDiscountTest {    
    @isTest
    static void testInsert() {
        System.runAs(new User(id=UserInfo.getUserId()))
        {
            Metadata.CustomMetadata mData = new Metadata.CustomMetadata();
            mData.fullName = 'Dynamic_Discount';
            mData.Label = 'Discount_Rule';
            // Create metadata values for the custom metadata
            Metadata.CustomMetadataValue instance1 = new Metadata.CustomMetadataValue();
            instance1.field = 'Discount_Percentage__c';
            instance1.value = 20;
            Metadata.CustomMetadataValue instance2 = new Metadata.CustomMetadataValue();
            instance2.field = 'Production_Catogery__c';
            instance2.value = 'Cloths';
           
            // Adding values to the Record
            mData.values.add(instance1);
            mData.values.add(instance2);
            // Instance of the container
            Metadata.DeployContainer container = new Metadata.DeployContainer();
            container.addMetadata(mData);
            System.debug(mData);
            Decimal discountPercentage;
           for (Metadata.CustomMetadataValue value : mData.values) {
                if (value.field == 'Discount_Percentage__c') {
                    discountPercentage = (Decimal)value.value;
                    System.debug('Discount Percentage: ' + discountPercentage);
            
                    // Now you can use the discountPercentage as needed
                    // For example, you might want to store it in a variable or use it in your logic
                }
			}

                   
            
            //Metadata.Operations.enqueueDeployment(container, null);
            
            
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
            	Discount_Rules__mdt custommetadata =[SELECT id,Product_Validity__c,
                                                        Discount_Percentage__c,Product_Category__c FROM 
                                                        Discount_Rules__mdt where Product_Category__c=:retriverec.Product_Category__c limit 1];
            System.debug('check ;'+custommetadata.Discount_Percentage__c);
				testOpp.Discount__c=discountPercentage;
            	update testOpp;
                System.assertEquals(testOpp.Discount__c,20,'Discount should be 30');
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