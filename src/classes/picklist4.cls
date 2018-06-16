public with sharing class picklist4 
{
public string selected{set;get;}
public string selected2{set;get;}
public list<selectoption>opt=new list<selectoption>();
public list<selectoption>getcons()
{
    for(account a:[select phone,name from account limit 6])
  {
   opt.add(new selectoption(a.phone,a.name));
  }
return opt;

}
public list<selectoption>getphone()
{
return opt;

}

}