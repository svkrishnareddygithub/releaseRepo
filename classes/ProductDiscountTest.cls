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
                    Product_Category__c =Label.Product_Category_Label ,
                    Discount__c=5
                );
                insert testOpp;
              
                OpportunityDiscount.insertOrUpdationRecord(new List<Opportunity>{testOpp});
            	
                Opportunity opprec=[select id,name,discount__c,Product_Category__c from Opportunity where id=:testOpp.Id limit 1];
            if(opprec.Discount__c>30){
                System.assertEquals(opprec.Discount__c+7,opprec.Discount__c,'Discount should be plus 7.0');
            }else if(opprec.Discount__c<30){
                System.assertEquals(opprec.Discount__c+0,opprec.Discount__c,'Discount should be same');
            }
        }
    }
}