trigger MobilePhoneReplace on Contact (before insert, before update) {
    
    public String temp;
    for (Contact a : trigger.New) {

        if (!String.IsBlank(a.MobilePhone)) {
                if (a.MobilePhone.startsWith('44')) {
                a.MobilePhone = '0' + a.MobilePhone.right(a.MobilePhone.length() - 2);
                temp = String.valueOf(a.MobilePhone);
                if(temp.length() < 11 || temp.length() > 11 ){
                a.MobilePhone = Label.ContactMobileNumberValidation;
                }
            } 
           
        }

    }

}