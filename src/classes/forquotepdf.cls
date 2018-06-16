public with sharing class forquotepdf {

public string TTC{set;get;}
public list<spider__PDF__c>pdfs{set;get;}
public boolean remoteitem{set;get;}
public list<spider__Quote__c> quote{set;get;}
public list<attachment> doc=new list<attachment>();
public string addendum{set;get;}
public contact conta{get;set;}
public string substr {set;get;}

public integer h1Hash = 0, h2Hash = 0, h3Hash = 0;
public string Level1, Level2, Level3;

public forquotepdf(ApexPages.StandardController controller) {
   //conta = new List<contact>();
   pdfs=[select id,name,PDF_Text__c from spider__PDF__c];
   //doc = [SELECT id, Body, ContentType, Name FROM attachment WHERE ID = '00P9000000h9uO6'];
    conta = [SELECT id,lastname,Photo__c from contact where id=:Apexpages.currentpage().getParameters().get('id') limit 1];
    substr = conta.Photo__c;
        Pattern h1Pattern = Pattern.compile('h1#');
        Pattern h2Pattern = Pattern.compile('h2#');
        Pattern h3Pattern = Pattern.compile('h3#');
        Matcher h1Match = h1Pattern.matcher(substr);
        Matcher h2Match = h2Pattern.matcher(substr);
        Matcher h3Match = h3Pattern.matcher(substr);
        while (h1Match.find()) {
            h1Hash++;
        }
        while (h2Match.find()) {
            h2Hash++;
        }
        while (h3Match.find()) {
            h3Hash++;
        }
        CallMethod(substr);
}
private string CallMethod(string str){
        if(h1Hash != 0){
            for(integer i = 1; i <= h1Hash; i++){
                Level1 = string.valueOf(i);
                substr= substr.replaceFirst('h1#',Level1);
                Integer h1CurrentIndex = substr.indexOf('h1#') == -1 ? substr.length() : substr.indexOf('h1#');
                for(integer j = 1; j <= h2Hash; j++){
                    Level2 = Level1+'.'+string.valueOf(j);
                    Integer h2HashIndex = substr.indexOf('h2#');
                    
                    if(h2HashIndex < h1CurrentIndex)
                        substr = substr.replaceFirst('h2#',Level2);
                    Integer h2CurrentIndex = substr.indexOf('h2#') == -1 ? substr.length() : substr.indexOf('h2#');
                    
                    for(integer k = 1; k <= h3Hash; k++){
                        Level3 = Level2+'.'+string.valueOf(k);
                        Integer h3HashIndex = substr.indexOf('h3#');
                        
                        if(h3HashIndex < h2CurrentIndex)
                            substr = substr.replaceFirst('h3#',Level3);
                    }
                }
            }
        }
        return substr;
    }
    //substr = addWhiteSpaceInUrlTooLong(substr);
   // update conta;
   
    /*for(spider__PDF__c pdf:pdfs)
    {
      if(pdf.name== 'Time to Change')
       {
         remoteitem=true;
         TTC=pdf.PDF_Text__c;  
       }
       if(pdf.name=='Addendums')
        {
          addendum=pdf.PDF_Text__c;
        }
    }*/

/*private string addWhiteSpaceInUrlTooLong(String text) {
        // Step 1 - Search anchor links
        Pattern ptn = Pattern.compile('<span[^>]*(>.*?)</span>');  //<a[^>]*(>.*?)</a>
        Matcher mch = ptn.matcher(text);
        Integer charPerLine = 30; 
        while (mch.find()) {
            String toReplace = mch.group(1);
            String substitute = '';
            Integer len = toReplace.length();

            if (len < charPerLine)
                continue;

            Integer elems; 

            if (len / charPerLine == 0)
                elems = len / charPerLine;
            else
                elems = len / charPerLine + 1;

            for (Integer i = 1; i <= elems; i++) {
                if ((charPerLine * i) < len)
                    substitute += toReplace.substring(charPerLine * (i - 1), charPerLine * i) + ' ';
                else
                    substitute += toReplace.substring(charPerLine * (i - 1), len) + ' ';
            }

            text = text.replace(toReplace, substitute); 
            System.debug('============================>' + text);          
        }

        // Step 2 - Search pasted links
        ptn = Pattern.compile('\\b\\s([A-Za-z])');  //(https?://\\S.*?)(\\s|$)
        mch = ptn.matcher(text);
        charPerLine = 10;

        while(mch.find()) {
            String toReplace = mch.group();
            String substitute = '';
            Integer len = toReplace.length();

            if (len > charPerLine)
                continue;

            Integer elems;

            if (len / charPerLine == 0)
                elems = len / charPerLine;
            else
                elems = len / charPerLine + 1;

            // Insert white spaces
            for (Integer i = 1; i <= elems; i++) {
                if ((charPerLine * i) < len)
                    substitute += toReplace.substring(charPerLine * (i - 1), charPerLine * i) + ' ';
                else
                    substitute += toReplace.substring(charPerLine * (i - 1), len) + ' ';
            }
           system.debug('=============> Replace' +substitute);
            text = text.replace(toReplace, substitute);
            system.debug('=============> Replace' +text);
        }
       
        return text;
    }*/

public List<string> getimageList(){
        quote = [select id,Number_of_Images__c from spider__Quote__c];
        integer imgLen = 0;
        for(spider__Quote__c len: quote){
            imgLen = integer.valueOf(len.Number_of_Images__c);
        }
        List<String> imgstr = new List<String>();
        for(integer i = 1; i <= 9; i++){
            imgstr.add('Brochure2/Page'+i+'.tif');
        }
    return imgstr;
    }

public string brochure {
    get {
    
     return EncodingUtil.Base64Encode(doc[0].body);
            }
        }

    }