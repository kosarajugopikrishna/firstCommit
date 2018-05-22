public class actionpoller 
{
    public integer seconds{set;get;}
    public actionpoller()
    {
        seconds=0;
        }
    public void action() 
    {
        seconds=seconds+10;
    }

}