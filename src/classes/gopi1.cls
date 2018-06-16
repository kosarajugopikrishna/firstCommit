public with sharing class gopi1 
{

    //public PageReference fa() {
    //    return null;
    //}


    public boolean k { get; set; }

    public String g { get; set; }

    public student__c Std { get; set; }
    public gopi1()
    {
      std=new Student__c();
    }
    
   
    public void save()
    {
       if(k==true)
         {
         
         g= Std.First_Name__c+'  '+Std.Last_Name__c;
         //std.name__c=g;
         
          
         }
        
     }
     
 }