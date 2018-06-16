global class Zipclass_WS 
{
 // Receive Attachments info from Attachment ParentId
   private static String API_STATUS_NORMAL = '200';
 
   webService static string getAttachmentByParentId(string sfdcId)
    {
         
         List<id> ids=new List<id>();
         if(string.isempty(sfdcId))  {
            return Zipclass.errorJson('Parameter sfdcId is required.');
        }
        system.debug('SFDCid'+sfdcId);
        string[] idsArray = sfdcId.split(',');
        for(integer i=0; i<idsArray.size();i++)
        {
           ids.add(idsArray[i]);
        }
                     
        integer totalSizeOfFiles=0;
        integer totalSizeAnInvoice=0;
        String invoiceId='';
        set<String> remainingsIdsSet=new set<String>();
        List<attachment> attachmentList=new List<attachment>();
          for(attachment att:[select ParentId,id,Name,Body,contenttype from attachment where ParentId IN:ids]) {
                integer eachFileSize=att.Body.size();
                String parentId=att.ParentId;
                att.contenttype='application/pdf';
                if(!invoiceId.equals(parentId)){
                    invoiceId=parentId;
                    totalSizeAnInvoice=eachFileSize;
                    System.debug('--ID: '+att.id+'. ParentId: '+parentId+'. FileSize: '+eachFileSize+'. TotalInvoiceSize: '+totalSizeAnInvoice);
                }else if(invoiceId.equals(parentId)){
                    totalSizeAnInvoice=totalSizeAnInvoice+eachFileSize;
                    System.debug('--ID: '+att.id+'. ParentId: '+parentId+'. FileSize: '+eachFileSize+'. TotalInvoiceSize: '+totalSizeAnInvoice);
                }
                if(eachFileSize<4500000 && totalSizeAnInvoice<4500000){
                    totalSizeOfFiles=totalSizeOfFiles+eachFileSize;
                    System.debug('--ID: '+parentId+'. FileSize: '+eachFileSize+'. TotalFileSize: '+totalSizeOfFiles+'. HeapSize: '+Limits.getHeapSize());
                    if(totalSizeOfFiles>= 4500000){
                          System.debug('--Adding to RemIDs ID: '+parentId+'. FileSize: '+eachFileSize);
                          remainingsIdsSet.add(parentId);
                     }else{
                          attachmentList.add(att);                      
                     }
                 }
           }
             String remainingIds=null;
             List<String> remainingIdList=new List<String>(remainingsIdsSet);
             for(integer i=0;i<remainingIdList.size();i++){
                 if(i==0){
                     remainingIds=remainingIdList.get(i);
                 }else{
                     remainingIds=remainingIds+','+remainingIdList.get(i);
                  }                 
             }
             
             List<Object> dataList = new List<Object>();
             for(Attachment at :attachmentList)
             {
                Map<String, String> atMap = new Map<String, String>();
                atMap.put( 'Name', at.Name );
                atMap.put( 'Body', EncodingUtil.base64Encode( at.body ));
                datalist.add( atMap );
             
             }
               
                 Map<String, Object> response = new Map<String, Object>();
                 response.put('status', API_STATUS_NORMAL);
                 if( datalist != null ){
                     response.put('data',datalist);
                     response.put('RIds', remainingIds);
                 }
                 return json.serialize( response );
                      
          //return Zipclass.normalJson( dataList );
         /*if( attachmentList == null || attachmentList.size() == 0 )          
        return Zipclass.errorJson('Attachment not found.');
        return wrapAttachmentList( attachmentList );*/
     
     }
     
        
                
         // Save Zip file to Document
   webService static String saveToDocument( String zipFileData, String fileName ){
       try{
            String userId = UserInfo.getUserId();
            List<Document> docList = [SELECT Id, Name, FolderId, Body FROM Document WHERE Name = :fileName AND FolderId = :userId];
            Document doc = new Document();
            if( docList == null || docList.size() == 0 ) {
                doc.Name = fileName;
                doc.FolderId = UserInfo.getUserId();
                doc.Body = EncodingUtil.base64Decode( zipFileData );
                insert doc;
               } 
            else {
                doc = docList.get(0);
                doc.Body = EncodingUtil.base64Decode( zipFileData );
                update doc;
            }
            System.debug('--ZipFileName: '+fileName+'. DocId: '+doc.Id);
            return Zipclass.normalJson( doc.Id );
        } catch ( Exception ex ) {
            return Zipclass.errorJson( ex.getMessage() );
        }
    }
    
}
     //Format JSON String from AttachmentList
/*Private static string wrapAttachmentList( List<Attachment> attachmentList ){

       List<Object> dataList = new List<Object>();
       for(Attachment at :attachmentList){
            Map<String, String> atMap = new Map<String, String>();
            atMap.put( 'Name', at.Name );
            atMap.put( 'Body', EncodingUtil.base64Encode( at.body ));
            dataList.add( atMap );
            System.debug('Heap Limit'+Limits.getHeapSize());  
          }
       return Zipclass.normalJson( dataList );}*/