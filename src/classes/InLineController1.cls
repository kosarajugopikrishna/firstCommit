public class InLineController1 {
 Public contact conRec{get;set;}
 Public id accRecId;
 Public account accRec{get;set;}
 
 public InLineController1(ApexPages.StandardController controller) {    

   if(ApexPages.currentPage().getParameters().get('id') != null) {
   
     accRecId = [select id,accountid from contact where id = :ApexPages.currentPage().getParameters().get('id')].accountid;
      if(accRecId != null)
         accRec = [select id,name,accountnumber,annualrevenue from account where id =:accRecId];
         
   }
 }

}