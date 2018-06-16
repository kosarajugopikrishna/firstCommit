public class Mathfunction 
{

    public String find { get; set; }

    public String opt { get; set; }

    public double r { get; set; }

    public double v2 { get; set; }

    public double v1 { get; set; }
    
 public mathfunction()
 {
 }
 public void find()
 {
 if(opt=='Sum')
 {
     r=v1+v2;
 }
 else if(opt=='Sub')
 {
    r=v1-v2;
  }
 else if(opt=='Multiply')
 {
   r=v1*v2;
 }
 else if(opt=='Divide')
 {
   r=v1/v2;
 }
  }

    
}