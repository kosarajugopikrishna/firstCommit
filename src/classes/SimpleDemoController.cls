Public with sharing class SimpleDemoController {
Public list<account> accRec {get;set;}
    Public SimpleDemoController(ApexPages.StandardController controller) {
      accRec = [select id,name,accountnumber,annualrevenue from account where id=:ApexPages.CurrentPage().getparameters().get('id')];
    }
}