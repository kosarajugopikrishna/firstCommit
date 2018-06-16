public with sharing class Doc_Extension {
    public Id recId  {get;set;}
    public string fileName{get;set;}  
    public Blob fileBody{get;set;} 
    public String contentType{get;set;}
   
    public Doc_Extension(ApexPages.StandardController controller)  
    {  
       recId =controller.getRecord().Id;  
              
    }       
    public PageReference UploadFile()  
    {  
        PageReference pr;  
        if(fileBody != null && fileName != null)  
        {  
          Attachment myAttachment = new Attachment();  
          myAttachment.ContentType = contentType;
          myAttachment.Body = fileBody;  
          myAttachment.Name = fileName;  
          myAttachment.ParentId = recId;  
          insert myAttachment;  
          pagereference ref;
          ref = new pagereference('https://ap1.salesforce.com/'+recId);
          ref.setredirect(true);
          return ref;               
        }  
        return null; 
    }          
}