public with sharing class popupex {

    public PageReference edit() {
        return null;
    }

public account accdetails { get; set; }
public string acc{set;get;}

public popupex()
{
list<account>acc= [select id,name,phone from account];

}
}