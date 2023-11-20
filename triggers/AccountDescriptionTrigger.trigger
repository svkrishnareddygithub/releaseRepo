trigger AccountDescriptionTrigger on Account (before insert,before update) {
	Account_Description_Handler.descriptionUpdate(trigger.new);
}