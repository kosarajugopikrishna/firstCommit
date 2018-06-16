@istest
private class beforeinserttestclass
{
 static @istest void insertdatamethod()
 {
  list<account>acc=new list<account>();
  list<contact>con=new list<contact>();
  for(integer i=0;i<=20;i++)
  {
   account ac=new account(name='dec',phone='5862');
   acc.add(ac);
   
   contact co=new contact(lastname=ac.name,phone=ac.phone,accountid=ac.id);
   con.add(co);
   
   }
   insert acc;
   insert con;
   }
   }