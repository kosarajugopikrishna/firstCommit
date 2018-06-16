Public class massupdateController{
Public List<sObject> sObjectList{get;set;}
Public List<wrapperclass> wrapList{get;set;}
Public string selectedField {get;set;}
Public string inputVal{get;set;}
Public List<string> sObjectfieldList{get;set;}
   Public massupdateController(){
     wrapList = New List<wrapperclass>();
   }
  
   public List<SelectOption> getfielItems() {
        List<SelectOption> options = new List<SelectOption>();
        for(string st:sObjectfieldList)
           options.add(new SelectOption(st,st));
        return options;
    }
 
   Public void UpdateSelectedRecords(){
   List<sObject> sObjList = New List<sObject>();
     for(wrapperclass wr: wrapList){
         if(wr.checkBox == true ){
            wr.soBjectrec.put(selectedField,inputVal);
         }   
         sObjList.add(wr.soBjectrec);
     }
     Update sObjList;
   }
 
   Public List<string> getFieldsList(){
     return sObjectfieldList;
   }
 
   Public List<wrapperclass> getsObjectRecords(){
    wrapList.clear();
    for(sObject acc : sObjectList)
       wrapList.add(New wrapperclass(false,acc));
    Return wrapList;
   }
 
   Public class wrapperclass{
    Public sObject soBjectrec{get;set;}
    Public Boolean checkBox{get;set;}
     Public wrapperclass(boolean selectFlag, sObject sObjRec){
       soBjectrec = sObjRec;
       checkBox = selectFlag;
     }
   }
}