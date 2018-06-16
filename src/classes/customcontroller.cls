public class customcontroller
{   
    
    public List<contact> acclist {get;set;}
    public customcontroller() 
    {
     
        accList = [SELECT Name FROM contact where name='g'];
    
       /* String Soql = 'SELECT Name FROM Member__c LIMIT ' + n;
       accList = Database.query(Soql);*/
    }           
}