public with sharing class setcontroller 
{

    public setcontroller(ApexPages.StandardController controller) {
    acc=(account)controller.getrecord();
    }
    
    public account acc{set;get;}
    public integer noofrecords{set;get;}
    public integer size{set;get;}
    public Apexpages.Standardsetcontroller ac1
    {
    get
    {
    if(acc==null)
    {
     size=5;
     ac1=new apexpages.standardsetcontroller(Database.getquerylocator([select id,name, phone from account limit 20]));
     system.debug(ac1);
     ac1.setPageSize(size);
     noOfRecords = ac1.getResultSize();
     }
     return ac1;
     }
     set;
     }
     public setcontroller(ApexPages.StandardSetController controller)
    {
      
    }
    }