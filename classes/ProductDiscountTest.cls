@isTest
public class ProductDiscountTest {
 @isTest
    static void testInsertOrUpdationRecordWithMetadata() {
        
        System.runAs(new User(id=UserInfo.getUserId())){
        // Create a test opportunity
        Opportunity testOpp = new Opportunity(
            Name = 'Test Opportunity',
            StageName = 'Prospecting',
            CloseDate = Date.today(),
            Product_Category__c = 'Cloths'
        );
        insert testOpp;
		
        OpportunityDiscount.insertOrUpdationRecord(new List<Opportunity>{testOpp});
        List<Opportunity> newList=[select id,Name,StageName,CloseDate,Product_Category__c,Discount__c from Opportunity where id=:testOpp.Id];
        
        // Create a test Discount Rule custom setting record

            Discount_Rule__c testDiscountSetting = new Discount_Rule__c(setupOwnerId =Userinfo.getProfileId(),Discount__c = 80);
            insert testDiscountSetting;
        
        Discount_Rule__c cs=Discount_Rule__c.getInstance(testDiscountSetting.SetupOwnerId);
        System.debug('InstanceDiscount:'+cs.Discount__c);
            
            List<Opportunity>updatelist1=new List<opportunity>();
            for(Opportunity o: newList){
            if(o.Product_Category__c=='Cloths'){
                if(cs.Discount__c==null){
               		 o.Discount__c=30;
                    updatelist1.add(o);
                }else{
                    o.Discount__c=80;
                    updatelist1.add(o);
                }
            }
        }
            update updatelist1;
            
        for(Opportunity o: updatelist1){
            if(o.Product_Category__c=='Cloths'){
                if(cs.Discount__c==null){
               		 System.assertEquals(o.Discount__c,30,'Discount should be 30');
                     System.debug('Opportunity Discount:111111111111111:'+o.Discount__c);
                }else{
                    System.assertEquals(o.Discount__c,80,'Discount should be 80');
                     System.debug('Opportunity Discount:222222222222222:'+o.Discount__c);
                }
            }
        }
        }
    }
    
    
    
    @isTest
    static void testInsert() {
        
        System.runAs(new User(id=UserInfo.getUserId())){
        // Create a test opportunity
        Opportunity testOpp = new Opportunity(
            Name = 'Test Opportunity',
            StageName = 'Prospecting',
            CloseDate = Date.today(),
            Product_Category__c = 'Cloths',
            Discount__c=30
        );
        insert testOpp;
            
            Opportunity testOpp1 = new Opportunity(
            Name = 'Test Opportunity',
            StageName = 'Prospecting',
            CloseDate = Date.today(),
            Product_Category__c = 'Cloths',
            Discount__c=80
        );
        insert testOpp1;
		
        OpportunityDiscount.insertOrUpdationRecord(new List<Opportunity>{testOpp});
        
        // Create a test Discount Rule custom setting record

        Discount_Rule__c testDiscountSetting = new Discount_Rule__c(setupOwnerId =Userinfo.getProfileId(),Discount__c = 80);
        insert testDiscountSetting;
        
        Discount_Rule__c cs=Discount_Rule__c.getInstance(testDiscountSetting.SetupOwnerId);
        System.debug('InstanceDiscount:'+cs.Discount__c);
            
        if(cs.Discount__c==null){
             System.assertEquals(testOpp.Discount__c,30,'Discount should be 30');
             System.debug('Opportunity Discount:111111111111111:'+testOpp.Discount__c);
        }else{
            System.assertEquals(testOpp1.Discount__c,80,'Discount should be 80');
             System.debug('Opportunity Discount:222222222222222:'+testOpp1.Discount__c);
        }
        }
    }
}

/*
 *  @isTest
    static void testInsertOrUpdationRecordWithSetting() {
        
         // Create a test opportunity
        Opportunity testOpp = new Opportunity(
            Name = 'Test Opportunity',
            StageName = 'Prospecting',
            CloseDate = Date.today(),
            Product_Category__c = 'Cloths'
        );
        insert testOpp;
        testOpp.Amount=50000;
		update testOpp;
        OpportunityDiscount.insertOrUpdationRecord(new List<Opportunity>{testOpp});
        List<Opportunity> newList=[select id,Name,StageName,CloseDate,Product_Category__c,Discount__c from Opportunity where id=:testOpp.Id];
        
        Profile p=[select id,Name from Profile where name='Standard User'];
        Discount_Rule__c cs=Discount_Rule__c.getInstance(p.Id);
        for(Opportunity o: newList){
            if(o.Product_Category__c=='Cloths'){
                if(cs.Discount__c!=null){
               		 System.assertEquals(o.Discount__c,80,'Discount should be 80');
                    System.debug('Opportunity Discount:11111111111111:'+o.Discount__c);
                }else{
                    System.assertEquals(o.Discount__c,30,'Discount should be 30');
                    System.debug('Opportunity Discount:222222222222222:'+o.Discount__c);
                }
            }
        }*/