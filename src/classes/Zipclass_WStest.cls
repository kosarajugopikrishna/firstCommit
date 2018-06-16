@istest(seealldata=true)
public class Zipclass_WStest{
 public static testmethod void Zipclass_WS(){
  spider__Invoice__c inv=new spider__Invoice__c();
   inv.spider__Customer_Name__c='Testname';
   insert inv;
   spider.Zipclass_WS.getAttachmentByParentId(inv.id);
   Attachment attach = new Attachment();
        Blob body;
        attach.Body = Blob.valueOf('Some Text');
        attach.name='testname';
        attach.IsPrivate = false;
        attach.ParentId = inv.ID;
        attach.contentType = 'application/pdf';
        insert attach;
   spider__Invoice__c inv1=new spider__Invoice__c();
   inv1.spider__Customer_Name__c='Testname1';
   insert inv1;
   
   
 }
 }