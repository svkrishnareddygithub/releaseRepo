trigger Contact_Trigger_DescriptionWithPhone on Contact (before insert,before update) {
	Contact_DescriptionWithPhone.descriptionUpdate(trigger.new);
}