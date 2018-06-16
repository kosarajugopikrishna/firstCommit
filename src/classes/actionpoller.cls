public class actionpoller 
{
    public integer seconds{set;get;}
    public actionpoller()
    {
        seconds=0;
        system.debug('gopi---');
        }
    public void action() 
    {
        seconds=seconds+10;
    }

}