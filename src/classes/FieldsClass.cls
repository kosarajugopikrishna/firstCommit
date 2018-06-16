public class  FieldsClass {

     public map<string,Schema.SObjectField> data {get;set;}
   
     public  FieldsClass (){
         data = Schema.SObjectType.Account.fields.getMap();
        }
    }