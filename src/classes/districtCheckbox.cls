public with sharing class districtCheckbox 
{
    public String city { get; set; }
    public boolean c3 { get; set; }
    public boolean c2 { get; set; }
    public boolean c1 { get; set; }
    
    public list<selectoption> getcities()
    {
     list<selectoption>opt=new list<selectoption>();
     if(c1==true && c2==false && c3==false)
     {
     opt.add(new selectoption('Vijayawada','Vijayawada'));
     opt.add(new selectoption('Guntur','Guntur'));
     opt.add(new selectoption('Vizag','Vizag'));
     }
      else if(c2==true && c1==false && c3==false)
     {
     opt.add(new selectoption('Chittoor','Chittoor'));
     opt.add(new selectoption('Anantapur','Anantapur'));
     opt.add(new selectoption('Kadapa','Kadapa'));
     }
     else if(c3==true && c1==false && c2==false)
     {
     opt.add(new selectoption('Warangal','Warangal'));
     opt.add(new selectoption('Khammam','Khammam'));
     opt.add(new selectoption('Rangareddy','Rangareddy'));
     }
     else 
     {
     opt.add(new selectoption('none','none'));
     }
     return opt;
    }
    }