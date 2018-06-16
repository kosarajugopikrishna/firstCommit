public with sharing class actionregion2 {

    public account acc{ get; set; }
    public boolean showphone{set;get;}
    public actionregion2()
    {
      acc=new account();
      //showphone=false;
     }
     public void show()
     {
     if(acc.name!=null)
     {
     showphone=true;
     }
     else
     showphone=false;
     }
     
     }