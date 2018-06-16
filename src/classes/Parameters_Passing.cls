Public class Parameters_Passing {
   public list<contact>conlist{set;get;}
    public Parameters_Passing ()
    {
        list<account>acclist=[select id,name,phone from account];
        conmethod(acclist);
        }
    public list<contact> conmethod (list<account> acc){
   
    conlist=[select id,lastname,phone,accountid from contact where accountid in : acc];        
          
      system.debug('contacts---'+conlist);
        return conlist;     
    }
}