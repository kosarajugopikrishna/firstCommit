public class MerchandiseController {

    public List<Account> getAllMerchandise() 
    {
        List<account> theMerchandise = 
            [SELECT Name, Phone FROM account LIMIT 10000];
        return(theMerchandise);
    }
}