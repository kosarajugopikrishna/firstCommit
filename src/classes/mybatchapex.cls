global class mybatchapex implements database.batchable<sobject>
{

global database.querylocator start(database.batchablecontext bc)
{
return database.getquerylocator('select name from account');
}

global void execute(database.batchablecontext bc,list<account>scope)
{
list<account>batchlist=new list<account>();
for(account a:scope)
{
a.name=a.name+'Updated';
}
update scope;
}

global void finish(database.batchablecontext bc)
{
}
}