public class CheckBoxEmailAssignmentPage{
    public List<Account> allAccounts{get;set;}
    public List<AccountModel> modelList{get;set;}
    public string to{get;set;}
    public List<string> addresses{get;set;} 
    public String fromAdd{set;get;}
    public String body{set;get;}
    public String subject{get;set;}
    public CheckBoxEmailAssignmentPage(){
        addresses = new List<String>();
        integer  i =0;
        allAccounts = [SELECT id,Name,spider__Email__c,phone from Account ];
        modelList = new List<AccountModel>();
        for(Account con :allAccounts){
        if(con.spider__Email__c!=null){
            AccountModel cm = new AccountModel();
            cm.srno = ++i;
            cm.con = con;
            modelList.add(cm);
            }
        }
    }
    public void sendEmail(){
        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        addresses = to.split(',');
        email.setInReplyTo(fromAdd);
        email.setSubject(subject);
        email.setToAddresses(addresses);
        email.setPlainTextBody(body);
        emails.add(email);
        Messaging.sendEmail(emails);
    }  
    public class AccountModel{
        public Integer srno{get;set;} 
        public Account con{set;get;}
        public String text{get;set;}    
        public AccountModel(){
            srno = 0;
            con = new Account();
        }
    }
}