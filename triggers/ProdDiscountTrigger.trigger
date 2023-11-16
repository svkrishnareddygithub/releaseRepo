trigger ProdDiscountTrigger on Opportunity (before insert, before update) {
    if(trigger.isBefore && (trigger.isInsert || trigger.isUpdate)){
        OpportunityDiscount.insertOrUpdationRecord(trigger.new);
    }
}