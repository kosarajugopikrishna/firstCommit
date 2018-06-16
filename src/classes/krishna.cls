public class krishna {

    public pagereference save()
     {
     apexpages.PageReference p = new apexpages.PageReference('/apex/krish');
     p.setredirect(true);
    // p.getparameters.put('message','Hello..world!');
      return p;       
    }
   
    
    /*window.onbeforeunload = function() 
    {
  return "Are you sure you want to leave this page?";
    }*/
    //}

}