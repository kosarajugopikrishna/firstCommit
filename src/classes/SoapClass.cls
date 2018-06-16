global class SoapClass {
  global class soap{
    webservice string name;
    webservice string phone;
    webservice string Rating;

  }
  global class response{
    webservice string message;
  }

    webservice static response createrec(soap sp){
     response rp = new response();
     try{
      account ac = new account(name=sp.name,phone=sp.phone,rating=sp.rating);
      insert ac;
     
      rp.message='200';
      }
      catch(exception ex)
      {
         
         rp.message = '401';
         
      }
      return rp;
    }
}