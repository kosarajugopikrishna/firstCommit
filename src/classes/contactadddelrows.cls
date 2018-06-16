public with sharing class contactadddelrows{    
   
    public List<contact> items {get; set;}
    public Integer count=1;
     public Integer index{get;set;}

    public contactadddelrows() {
  
       
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
       system.debug('*****indexnum*****'+index);
       index = Integer.valueOf(ApexPages.currentPage().getParameters().get('index'));
       system.debug('*******ro'+index );
       items.remove(index);        
       
       //Integer i = items.size();
       //items.remove(i-1);           
    }          
    public PageReference save(){          
    return null;
    
    }
    }