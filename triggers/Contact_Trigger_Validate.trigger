trigger Contact_Trigger_Validate on Contact (before insert,before update) {
	Contact_Handler.updateOrInsertRecords(trigger.new);
}