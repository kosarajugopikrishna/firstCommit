public with sharing class BrochureImages {

  
    public static Set<String> getAvailableImages() {
    list<staticresource>brochurelist=new list<staticresource>();
    brochurelist=[select name, body from staticresource where name='brochure'];
    return(new Set<String> {'SampleBrochure', 'SampleBrochure'});
    return(new Set<String> {'Brochure', 'Brochure'});
    }
    
     public static List<SelectOption> getThemeOptions() {
       List<SelectOption> themeOptions = new List<SelectOption>();
       for(String themeName : getAvailableImages()) {
       themeOptions.add(new SelectOption(themeName, themeName));
       themeOptions.add(new SelectOption(themeName, themeName));
       themeOptions.add(new SelectOption(themeName, themeName));
    }
  return themeOptions;
}

    
     public String Brochure { 
      get {
         List<String> imageList = new List<String>();
         imageList.addAll(getAvailableImages());
         system.debug('------------>'+imagelist);
         Brochure =  imagelist[0]; 
         system.debug('----------->'+Brochure);   
         return Brochure;
        }
        set {
            if(getAvailableImages().contains(value)) {
                Brochure = value;
            }
        }
        }
}