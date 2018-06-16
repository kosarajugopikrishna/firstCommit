Public class wildcardController {
    Public string inputtext{get;set;}
    Public List<account> accList{get;set;}
    Public boolean flagshow{get;set;}
    Public wildcardController(){
     flagshow = false;
    }    
    Public void searchRecords(){
     flagshow = true;
      accList = database.Query('select name,accountnumber from account where name like '+'\''+'%'+inputtext+'%'+'\'');
    }
}