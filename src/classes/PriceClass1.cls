public with sharing class PriceClass1 {    
   
    public List<contact> items {get; set;}
    public Integer count=1;
     public Integer rowNum{get;set;}

    public PriceClass1(ApexPages.StandardController controller) {
  
       
        items  = new List<contact>();
       
        contact PLItems = new contact();
       
        items.add(PLItems); 
        
        //items.add(new Price2__c());   
    }
    public void AddItems(){
   
        contact PLItems = new contact();
       
        items.add(PLItems);   
        //items.add(new Price_Deviation_Approval__c());
        //count++;
        //System.debug(count);
    }
    public void RemoveItems(){       

       rowNum = Integer.valueOf(ApexPages.currentPage().getParameters().get('index'));
       items.remove(rowNum);        
       
       //Integer i = items.size();
       //items.remove(i-1);           
    }          
    public PageReference save(){          
    return null;
    
    }
    }