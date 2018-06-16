Public with sharing class SendemailController{
   Public SendemailController(){
   }
  
 Public void sendEmailFunction(){
   Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
   String[] toAddresses = new String[] {'k.gopikrishna@steadfastglobal.com'}; 
   String[] ccAddresses = new String[] {'k.gopikrishna@steadfastglobal.com'};
   mail.setToAddresses(toAddresses);
   mail.setCcAddresses(ccAddresses);
   mail.setReplyTo('k.gopikrishna@steadfastglobal.com');
   mail.setSenderDisplayName('Gopi krishna');
   mail.setSubject('Sending email through apex');
   mail.setBccSender(false);
   mail.setUseSignature(false);
   mail.setPlainTextBody('This is Gopi krishna.');
   //mail.setHtmlBody('<b> This is HTML body </b>' );
   Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
 } 

}