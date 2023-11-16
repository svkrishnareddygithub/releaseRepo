@isTest
public class ProductDiscountTest {
	@isTest
    public static void testCallMe() {
        
        System.runAs(new User(Id=UserInfo.getUserId()))
        {
            
            
            Opportunity o=new Opportunity();
            o.Name='Silver';
            o.CloseDate=Date.today()+10;
            o.StageName='Prospecting';
            o.Product_Category__c=Label.Product_Category_Label;
            o.Discount__c=30;
            insert o;
            OpportunityDiscount.insertOrUpdationRecord(new List<Opportunity>{o});
            System.assertEquals(o.Discount__c,30,'discount should be 30');
            
            
            
        }
        
    }
}

/*
 * Discount_Rules__mdt serviceMetadat =[SELECT id,Product_Validity__c,
                                                        Discount_Percentage__c FROM Discount_Rules__mdt
                                                        WHERE Product_Category__c=:o.Product_Category__c];
            Profile prof=[select id,name from Profile where name='Standard User'];
            Discount_Rule__c instance = Discount_Rule__c.getInstance(prof.Id);
        
            if(serviceMetadat!=null && instance.Discount__c!=null)
            {
                 System.assertEquals(o.Discount__c,80,'Discount percentage should be 80');
            }
            else if(serviceMetadat!=null)
            {
                 System.assertEquals(o.Discount__c,30,'Discount percentage should be 30');
            }
        
            o.CloseDate=Date.today()+11;
            update o;
            if(serviceMetadat!=null && instance.Discount__c!=null)
            {
                 System.assertEquals(o.Discount__c,80,'Discount percentage should be 80');
            }
            else if(serviceMetadat!=null)
            {
                 System.assertEquals(o.Discount__c,30,'Discount percentage should be 30');
            }
*/