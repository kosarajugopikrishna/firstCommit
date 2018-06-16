public class wrapper {
 public list<wrapperclass> listfields {set;get;}
    public PageReference addfields() {
        listfields.add(new wrapperclass(new account(),new contact()));
        return null;
    }

 public class wrapperclass{
  public account acc {set;get;}
  public contact con {set;get;}
  public wrapperclass(account acc,contact con){
    this.acc = acc;
    this.con = con;
  }
 
 }

}