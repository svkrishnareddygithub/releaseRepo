trigger AccountDescriptionTrigger on Account (before insert,before update) {
	Account_Description_Handler.description_update(trigger.new);
}