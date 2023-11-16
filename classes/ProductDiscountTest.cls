@isTest
public class ProductDiscountTest {
	@isTest
    public static void testCallMe() {
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
        User testUser = new User(
            ProfileId = p.Id,
            LastName = 'krishna',
            FirstName = 'sv',
            Email = 'krishna@gmail.com',
            Username = 'krishna@gmail.com' + System.currentTimeMillis(),
            Alias = 'krish',
            CommunityNickname = 'venky',
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            TimeZoneSidKey = 'America/New_York'
        );
        insert testUser;
        
        System.runAs(testUser)
        {
            Opportunity o=new Opportunity();
            o.Name='Silver';
            o.CloseDate=Date.today()+10;
            o.StageName='Prospecting';
            o.Product_Category__c=Label.Product_Category_Label;
            o.Discount__c=30;
            insert o;
            Discount_Rules__mdt serviceMetadat =[SELECT id,Product_Validity__c,
                                                        Discount_Percentage__c FROM Discount_Rules__mdt
                                                        WHERE Product_Category__c=:o.Product_Category__c AND Product_Validity__c >=TODAY limit 1];
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
        }
        
    }
}