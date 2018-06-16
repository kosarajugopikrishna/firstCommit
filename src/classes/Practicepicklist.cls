public class Practicepicklist 
{
public boolean flag{set;get;}
public string accountfields{get;set;}
public List<account>acclist=new List<account>();
public List<selectoption>options{get;set;}
Public List<contact>conlist=new List<contact>();
public List<selectoption>coptions{get;set;}

public Practicepicklist ()
{

acclist=[select id,name from account];
options=new List<selectoption>();
options.add(new selectoption('','---None---'));
for(account a:acclist)
{
options.add(new selectoption(a.id,a.name));

}
}
public void data()
{

conlist=[select id,name from contact where contact.accountid=:accountfields];
coptions=new List<selectoption>();

for(contact c:conlist)
{
flag=true;
coptions.add(new selectoption(c.id,c.name));
}
}
}