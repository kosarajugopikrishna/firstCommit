public class beforeinsert
{
//public static void insertdata(list<account> a)
  public void insertdata(list<account> a)
{
 //list<account>acclist=new list<account>();
 list<contact>acclist=new list<contact>();
 for(account ac:a)
 {
  //account acc=new account(name=ac.name,phone=ac.phone);
  contact acc=new contact(lastname=ac.name,phone=ac.phone,accountid=ac.id);
  acclist.add(acc);
  }
  insert acclist;
  }
  }