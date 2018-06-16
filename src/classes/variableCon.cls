public class variableCon 
{
  public list<contact> contact{set;get;}

    public list<Contact> getContact() 
    {
        if (contact == null)
        {                      
        contact = [select LastName from Contact where id = :ApexPages.currentPage().getParameters().get('id')];
        }
      return contact;
    }
}