public class standardctrl_1 {

    public standardctrl_1(ApexPages.StandardController controller) {

    }

public account account {set;get;}
public boolean phone {set;get;}
    public standardctrl_1(ApexPages.StandardSetController controller) {
 account = new account ();
 phone = false;
    }
public void mouseout(){
   if(account.name!=null)
   {
   phone=true;
   }
   phone=false;
}

}