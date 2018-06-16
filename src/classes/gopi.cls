public class gopi 
{

    public gopi() {

    }

    public Student__c  std {set;get;}
    public gopi(ApexPages.StandardController controller) 
    {
     std=new student__c();
    }
    public pagereference save()
    {
    
    std.name__c=std.first_name__c+''+std.last_name__c;
    insert std;
    pagereference p=new pagereference();
    return null;
    }
 }