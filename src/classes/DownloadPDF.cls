public with sharing class DownloadPDF {

    public String getMyimageurl() {
        document docu = [  select id, body, contenttype from document where id='01590000006FDla'];
        string imageid = docu.id; 
       imageid = imageid.substring(0,15);
    return '/servlet/servlet.FileDownload?file=' + imageid;
    }


    public list<attachment> doc=new list<attachment>();
    public DownloadPDF(){
    doc = [SELECT id, Body, ContentType, Name FROM attachment where id='00P9000000h9uO6'];
    //01590000009XtCS
    }
    public string str {
    get {
    
     return EncodingUtil.Base64Encode(doc[0].body);
            }
        }
   
    }