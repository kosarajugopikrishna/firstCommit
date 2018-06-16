public class ContactExtension4
{
    private Contact c1;

    public ContactExtension4(ApexPages.StandardController sController)
    {
        this.c1= (Contact)sController.getRecord();
    }
}