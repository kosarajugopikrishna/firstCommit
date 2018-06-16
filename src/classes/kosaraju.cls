public class kosaraju 
{
    public account acc{set;get;}
    public string ds{set;get;}
    public kosaraju(ApexPages.StandardController controller) 
    {
     acc=(account)controller.getrecord();
    }
    public void click()
    {
    ds=acc.name;
    }

}