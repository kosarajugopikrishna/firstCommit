public with sharing class Mycontroller1
 {
    public account acc{set;get;}
    public Mycontroller1(ApexPages.StandardController controller) 
    {
        //acc=(account)controller.getrecord();
    }
        

    public Mycontroller1(ApexPages.StandardSetController controller) {

    }

}