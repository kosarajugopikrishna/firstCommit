global class CreatePDF
{
 webService static void insertintoattachments(string QuoteID,string Quotename)
  {
    PageReference pdf = new PageReference('/apex/PDF_RichText?id='+QuoteID);
        Attachment attach = new Attachment();
        Blob body;
        try {
          body = pdf.getContentAsPDF();
         } 
        catch (VisualforceException e) {
            body = Blob.valueOf('Some Text');
         }
        attach.Body = body;
        attach.name= Quotename +' Agreement' +' .PDF';
        attach.IsPrivate = false;
        attach.ParentId = QuoteID;
        attach.contentType = 'pdf';
        insert attach;
    }
}