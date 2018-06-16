global class samplebatchapex implements Database.Batchable<sobject>,Schedulable{
   global database.querylocator start(database.Batchablecontext bc){
     return Database.getQueryLocator([select id,spider__Disc_Amount__c,spider__Net_Amount__c from spider__Invoice__c]);
     }
   global void execute(Database.BatchableContext bc,List<spider__Invoice__c>Inv){
    for(spider__Invoice__c invc:Inv)
     {
      if(invc.spider__Net_Amount__c > 10000)
       {
         invc.spider__Disc_Amount__c = 1500;
       }
       else if(invc.spider__Net_Amount__c < 10000)
       {
       invc.spider__Disc_Amount__c = 1000;
       }
     }
      update inv;
    }
    global void finish(database.batchableContext BC)
     {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {'gopik909@gmail.com','gopikrishna283@yahoo.com'};
        mail.setToAddresses(toAddresses);
        mail.setSubject('Discount of Ur Invoice');
        mail.setPlainTextBody('Hi');
        Messaging.sendEmail(New Messaging.SingleEmailMessage[]{mail});
     }
     global void execute(SchedulableContext SC){
      samplebatchapex sba= new samplebatchapex();
      database.executebatch(sba,10);
      }
      public static void SchedulerMethod(){
      string sch = '0 50 16 * * ?';
      system.schedule('Test Schedule',sch,new samplebatchapex());
      }
 }