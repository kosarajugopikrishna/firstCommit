public with sharing class contactpage {

   
   // public string id3{set;get;}
    public contact con{set;get;}
    //public String conemail { get; set; }

    //public String conphone { get; set; }

    //public String conname { get; set; }
    public contactpage()
    {
    con=new contact();
     con.Lastname=apexpages.currentpage().getparameters().get('id');
    con.phone=apexpages.currentpage().getparameters().get('id2');
    }
     public PageReference save() 
    {
     /*   if(id3!=null)
        {
         con.lastname='Kumar';
         }   */
        insert con;
        return new pagereference('/'+con.id);
        
    }
}