@isTest
public class ProductDiscountTest {    
    @isTest
    static void testInsert() {
        System.runAs(new User(id=UserInfo.getUserId()))
        {            
            
                Opportunity testOpp = new Opportunity(
                    Name = 'Test Opportunity',
                    StageName = 'Prospecting',
                    CloseDate = Date.today(),
                    Product_Category__c = 'Cloths'
                );
                insert testOpp;
            	Opportunity testOpp1 = new Opportunity(
                    Name = 'Test Opportunity',
                    StageName = 'Prospecting',
                    CloseDate = Date.today(),
                    Product_Category__c = 'Sports'
                );
                insert testOpp1;
            
                // Create a test Discount_Rule_Setting__c instance
                Discount_Rule_Setting__c testSetting = new Discount_Rule_Setting__c(
                    Name = 'Add 7 Percentage',
                    Discount__c = 7.0
                );
                insert testSetting;
				
            
        
                Test.startTest();
                OpportunityDiscount.insertOrUpdationRecord(new List<Opportunity>{testOpp,testOpp1});
       			Test.stopTest();
                if(testOpp.Product_Category__c=='Cloths'){
                    testOpp.Discount__c+=testSetting.Discount__c;
                }
               update testOpp;
            	
                Opportunity opprec=[select id,name,discount__c,Product_Category__c from Opportunity where id=:testOpp.Id limit 1];
                Opportunity opprec1=[select id,name,discount__c,Product_Category__c from Opportunity where id=:testOpp1.Id limit 1];
            if(opprec.Product_Category__c=='Cloths'){
                System.assertEquals(37.0,opprec.Discount__c,'Discount should be 37.0');
            }else{
                System.assertEquals(10.0,opprec1.Discount__c,'Discount should be 10');
            }
        }
    }
}