public class Acco {
    public string gopi2{set;get;}
    public PageReference edit() 
    {
        system.debug('--1---'+gopi2);
        system.debug(apexpages.currentpage().getparameters().get('gopi'));
        system.debug(apexpages.currentpage().getparameters());
        return null;
        
        
        
    }

}