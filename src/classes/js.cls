public with sharing class js {

   public list<selectoption> getitems() {
    list<selectoption> options = new list<selectoption>();
    options.add(new selectoption('One-off', 'One-off'));
    options.add(new selectoption('Recurring', 'Recurring'));
    options.add(new selectoption('Prepaid', 'Prepaid'));
    options.add(new selectoption('Postpaid', 'Postpaid'));
    return options;
    }
   

}