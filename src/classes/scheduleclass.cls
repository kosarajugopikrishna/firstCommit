global class scheduleclass implements schedulable{

 global void execute(schedulablecontext SC){
  database.executebatch(new batchclass(),2);
 }
}

/*scheduleclass sch=new scheduleclass();
String con = '0 10 23 * * ?'; //seconds min hrs daysofmonth Month daysofweek year*/
/*system.schedule('scheduleclassname',con,sch);*/