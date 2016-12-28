public class ContactExt {
    public Contact record {get; set;}
    public String city {
        get {
            return record.Account.BillingCity;
        }
        private set;
    }

    public ContactExt(ApexPages.StandardController sc) {
        record = (Contact)sc.getRecord();
    }
}