public class dipslayinputtextinpageblocktable

{

public list<contact> con{get;set;}

public dipslayinputtextinpageblocktable ()

{

    con=[select name,mailingcity,email from contact limit 15];

}

public void updatecon()

{

    if(con.size()>0)

    {

        update con;

    }

}

}