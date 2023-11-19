trigger AccountTrigger_States_District on Account (before insert,before update) {
   Account_Handler.updateOrInsertRecords(trigger.new);
}