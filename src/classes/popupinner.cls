public class popupinner
{
    public boolean displayPopup {get; set;}
    public List<Account> acc {get;set;}
    public List<contact> con {get;set;}
    
  
    public popupinner()
    {
     displayPopup = false;
    }
  
    public void members()
    {
     displayPopup = true;
     String sql = 'SELECT Name,Email__c,phone FROM Account';
     acc = Database.Query(sql);
    }
  
    public void blogs()
    {
     displayPopup = true;
     String sql = 'SELECT lastName,phone FROM contact';
     con = Database.Query(sql);
    }   
  
    
  
    public void closePopup()
    {
     displayPopup = false;     
    }
}