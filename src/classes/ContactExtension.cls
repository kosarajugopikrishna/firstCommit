public with sharing class ContactExtension {

    public ContactExtension(ApexPages.StandardController controller) 
    {
     system.debug('hii');
    }
  
    public String getGreeting()
{
    return 'Hi ' + contact.FirstName + ' how have you been?  Please update the following.';
}


}