public with sharing class ProjectTeamAllocationCtrlCls {

    Account a;
    ApexPages.StandardController scontroller;
    
    

 public String selectedPhoneNumber {get;set;}
    public String selectedPhoneNumberContactName {get;set;}
    public String selectedObject {get;set;}
    public String selectedField {get;set;} 
    public list<PhoneNumberDetail> getPhoneLocationsForGivenNumber1 {get;set;}  
    public string display{get;set;}
    
    
    private Map<String, Schema.SObjectType> schemaMap{
        get{
            if(schemaMap == null){
                schemaMap = Schema.getGlobalDescribe();
            }
            return schemaMap;
        }private set{}
    }
    
    public list<selectOption> allFieldsForSelectedObject {get;set;}
    /*Controller*/    
    public ProjectTeamAllocationCtrlCls(){
        allFieldsForSelectedObject = new list<selectOption>();
    }
    
    /*To get all object which have phone numbers*/
    public list<selectOption> getsObjects(){    
         selectedPhoneNumber = ''; //to reset phone numbers field
         list<selectOption> objectsList = new list<selectOption>();
         list<String> tempObject = new list<String>{/*'Account','Lead','Opportunity','Contact','Case',*/ 'User', 'Contact'};
         objectsList.add(new SelectOption('','--Select Object--'));
         Map<String, Schema.SObjectType> gd = schemaMap;
         Schema.DescribeSObjectResult r;
         Schema.SobjectType sobjecttype;       
         /*for(String objectKey: gd.keySet()){ 
             sobjecttype = gd.get(objectKey);
             r = sobjecttype.getDescribe();
             if((r.getName()).contains('__c'))
                 objectsList.add(new SelectOption(r.getName(), r.getLabel()));
         }*/
         for(string obj:tempObject){ 
            objectsList.add(new selectOption(obj,obj));
         }
       return objectsList;
    }
    
    /*To get all fields on the basis of object*/ 
    public list<selectOption> getFieldsForSelectedObject(){    
       selectedPhoneNumber = ''; //to reset phone number field    
       list<selectOption> fieldsName = new list<selectOption>(); 
       try{
           if(selectedObject != null || selectedObject != '' || selectedObject != '--Select Object--'){             
                Map<String, Schema.SObjectField> fieldMap = schemaMap.get(selectedObject).getDescribe().fields.getMap();        
                for(Schema.SObjectField sfield : fieldMap.Values()){
                    schema.describefieldresult dfield = sfield.getDescribe();
                    //schema.Displaytype disfield= dfield.getType();
                    system.debug('#######'  + dfield );       
                    /*if(dfield.getType() == Schema.displayType.Phone){*/
                        fieldsName.add(new SelectOption(dfield.getName(),dfield.getLabel ()));
                    //}   
                }
            }
        }catch(Exception ex){          
            apexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'There is no Phone or Fax Field Exist for selected Object!'));
        }           
        return fieldsName;
    }     
    /*to populate field*/
    public void populateFields(){
        allFieldsForSelectedObject = getFieldsForSelectedObject();
    }
    
    /*Phone Number's Records*/
    public class PhoneNumberDetail{
        public String contactName{get;set;}
        public PhoneNumberDetail(String contactName){
            this.contactName = contactName;
        }
   }  
   public ProjectTeamAllocationCtrlCls(ApexPages.StandardController controller) {

           this.a = (Account)controller.getRecord();
           this.scontroller = controller;
           for(Account proje : [select id from Account])
           {
             // proje.Allocated_Members__c = selectedPhoneNumber;
           }
           
    }  
   public pagereference save(){
  /* //a.Allocated_Members__c = selectedPhoneNumber.removeEnd(',');
   //List<string> teamsizecalc = a.Allocated_Members__c.split(',');
   if(teamsizecalc.size() > 0){
   a.Team_Size__c = teamsizecalc.size();
      if(a.Senior_Member__c != null){
          a.Team_Size__c = teamsizecalc.size()+1;
      }
   }
   upsert a;
   scontroller.save();     
   Pagereference detailpage = new ApexPages.StandardController(a).view();
   detailpage.setRedirect(true);
   return detailpage;*/
   return null;  
   } 
 public pagereference cancel(){
  /* //a.Allocated_Members__c = selectedPhoneNumber.removeEnd(',');
   //List<string> teamsizecalc = a.Allocated_Members__c.split(',');
   if(teamsizecalc.size() > 0){
   a.Team_Size__c = teamsizecalc.size();
      if(a.Senior_Member__c != null){
          a.Team_Size__c = teamsizecalc.size()+1;
      }
   }
   upsert a;
   scontroller.save();     
   Pagereference detailpage = new ApexPages.StandardController(a).view();
   detailpage.setRedirect(true);
   return detailpage;*/
   return null;  
   } 
}