global class batchinsertrecords implements database.Batchable<sObject> {
    global Database.Querylocator start(Database.BatchableContext bc){

        
        return database.getQueryLocator('select lastName,phone from contact');
    }
    global void execute(Database.BatchableContext bc,list<contact> sc) {
        List<contact> acclist = new List<contact>();
        for(contact a :sc)
        {
         for(integer i=0;i<3;i++)
         {
        contact newAcc = new contact();
        newacc.lastname='steadfast'+ i;
        newaCC.phone='0'+ i;
        acclist.add(newAcc);
        }
        }
    insert acclist;       
   }
   global void finish(Database.BatchableContext bc) {    
}
}