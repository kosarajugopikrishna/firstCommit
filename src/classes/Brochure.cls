public with sharing class Brochure {

    public String Logo { get; set; }

    public static Set<String> getAvailableThemes() {
    list<staticresource>brochure=new list<staticresource>();
     //brochure=[select name, body from staticresource where name='brochure'];
     return(new Set<String> {'brochure', 'brochure'});
    }
    public string NBrochure {
     get {
         List<String> themeList = new List<String>();
         themeList.addAll(getAvailableThemes());
         NBrochure = themeList[0];              
         return NBrochure;
        }
        set {
            if(getAvailableThemes().contains(value)) {
                NBrochure = value;
            }
        }
}
}