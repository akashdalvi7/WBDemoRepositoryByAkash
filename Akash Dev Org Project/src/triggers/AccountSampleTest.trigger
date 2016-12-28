trigger AccountSampleTest on Account (before update) {
    for (Account updatedAccount : Trigger.new) {
        updatedAccount.Sic = 'Akash_Sample_Trigger';
    }
}