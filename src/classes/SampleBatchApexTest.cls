@isTest(seeallData=true)
Public class SampleBatchApexTest{
 public static testmethod void TestSampleBatchApex(){
  /*Profile prof = [select id from profile where name='system Administrator'];
     User usr = new User(alias = 'usr', email='us.name@vmail.com',
                emailencodingkey='UTF-8', lastname='lstname',
                timezonesidkey='America/Los_Angeles',
                languagelocalekey='en_US',
                localesidkey='en_US', profileid = prof.Id,
                username='testuser128@testorg.com');
                insert usr;*/
   
   spider__Invoice__c INV1= new spider__Invoice__c(spider__Customer_Name__c='ram',spider__Cost__c=5000,spider__Quantity__c=2,spider__Disc_Amount__c=1500);//,Ownerid = usr.id
     insert inv1;
     inv1.spider__Quantity__c=3;
     update inv1;
   spider__Invoice__c INV2= new spider__Invoice__c(spider__Customer_Name__c='ram',spider__Cost__c=5000,spider__Quantity__c=4,spider__Disc_Amount__c=1500);//,Ownerid = usr.id
     insert inv2;
     inv2.spider__Quantity__c = 1;
     update inv2;
   
   samplebatchapex objBatch = new samplebatchapex();
    
   ID batchprocessid = Database.executeBatch(objBatch);
   samplebatchapex schbatch = new samplebatchapex();
    String sch = '0 0 23 * * ?'; 
    system.schedule('Test Batch Apex', sch, schbatch); 
   
    
  }
 }