trigger ProdDiscountTrigger on Opportunity (before insert, before update) {
        OpportunityDiscount.insertOrUpdationRecord(trigger.new);
    
}