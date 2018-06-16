global class CertificateGenerationCls
{
 webservice static void certgenerated(string SessionId,string certificategenerated){
  list<spider__Session_Student__c> sslist=[select id,spider__Contact__c,spider__Contact__r.id,spider__Contact__r.lastname,spider__Status__c,spider__Training_Session__c from spider__Session_Student__c
                                              where spider__Training_Session__c =:SessionId and spider__Status__c='completed']; 
    list<string>conlist= new list<string>();
    
    list<attachment> attlist=new list<attachment>();                                          
      for(spider__Session_Student__c ss: sslist)
       {
        PageReference pdf = new PageReference('/apex/wordpage?id='+SessionId+ '&studentnames=' +ss.spider__Contact__r.lastname);
         Attachment attach = new Attachment();
         Blob body;
         try {
          body = pdf.getContent();
         } 
        catch (VisualforceException e) {
            body = Blob.valueOf('Some Text');
         }
         //body = Blob.valueOf('Some Text');
         attach.Body = body;
         attach.name= 'Course Certificate.doc';
         attach.IsPrivate = false;
         attach.ParentId = ss.spider__Contact__r.id;
         attach.contentType = 'application/vnd.ms-word';
         attlist.add(attach);
      }
        insert attlist;
        
 }
}