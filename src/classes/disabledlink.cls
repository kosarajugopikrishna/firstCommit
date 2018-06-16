public with sharing class disabledlink 
{

    public account acc { get; set; }
public  string user1 =  [select ProfileId from User  where Profile.Name = 'System Administrator'].profileId;
public  string user2 =  [select profileid from user  where profile.Name='My Profile'].profileId;
public boolean isdisabled{get;set;}

public void disabled()
{
 If(userinfo.getprofileId() == user1)
 {
  isdisabled=false;
 }
 if(userinfo.getprofileId() == user2)
 {
  isdisabled=true;
 }
}
}