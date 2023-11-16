@isTest
public class ProductDiscountTest {
	@isTest
    public static void testCallMe() {
        
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
        Profile p=[select id,name from Profile where name='Standard User'];
        Discount_Rule__c instance = Discount_Rule__c.getInstance(p.Id);
        
        if(serviceMetadat!=null && instance.Discount__c!=null)
        {
             System.assertEquals(o.Discount__c,80);
        }
        else if(serviceMetadat!=null)
        {
             System.assertEquals(o.Discount__c,30);
        }
        
        o.CloseDate=Date.today()+11;
        update o;
        if(serviceMetadat!=null && instance.Discount__c!=null)
        {
             System.assertEquals(o.Discount__c,80);
        }
        else if(serviceMetadat!=null)
        {
             System.assertEquals(o.Discount__c,30);
        }
    }
}



       /* 
           // Create metadata instance
        Metadata.CustomMetadata mData = new Metadata.CustomMetadata();
        mData.fullName = 'Salesforce_Metadata_Rule';
        mData.Label = 'Salesforce_Rule';

        // Create metadata value instance
        Metadata.CustomMetadataValue instance = new Metadata.CustomMetadataValue();
        instance.field = 'Rule_Name__c';
        instance.value = 'New Value';
        
        instance.field = 'Product_Validity__c';
        instance.value = Date.today()+1;
        
        instance.field = 'Discount_Percentage__c';
        instance.value = 40;
        
        instance.field = 'Product_Category__c';
        instance.value = 'Cloth';

        // Add values to the record
        mData.values.add(instance);

        // Create deploy container
        Metadata.DeployContainer container = new Metadata.DeployContainer();
        container.addMetadata(mData);
	*/