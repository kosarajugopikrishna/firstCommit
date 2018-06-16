public with sharing class previous 
{
    public account acc{set;get;}
    public previous(ApexPages.StandardController controller) {
    acc=(account)controller.getrecord();
    }
    public pagereference save()
    {
    update acc;
    return new pagereference('/apex/editdeletetable');
    }
}