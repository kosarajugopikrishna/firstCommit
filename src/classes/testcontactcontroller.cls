@istest(seealldata=true)
private class testcontactcontroller
{
 static testmethod void contactcontroller()
 {
  
  contact con=new contact(lastname='testacc');
  insert con;
  }
  }