trigger ProdDiscountTrigger on Opportunity ( before update) {
        OpportunityDiscount.insertOrUpdationRecord(trigger.new);
}