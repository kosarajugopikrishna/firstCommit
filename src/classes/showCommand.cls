public class showCommand
{
public String name {get; set;}
public void disName()
{
name = ApexPages.CurrentPage().getParameters().get('Krishna');
}
//public pagereference disname()
//pagereference p=new pagereference(
}