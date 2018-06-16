public class databasecls{
    
    public void insertRecords(){
        //Clicking on New button
        Account acc = new Account();
        
        acc.Name='Test Account';
        acc.Phone='1234567890';
        acc.Rating ='Hot';
        acc.NumberOfEmployees=200;
        
        insert acc;
    }

    

}