public with sharing class MapUsage {
        
        public static void mapUse(){
        
            Map<Integer, String> mp = new Map<Integer, String>();
            // kEy is Integer
            // value is String
            
            mp.put(1221,'Mahi');
            //mp.put(1226,'Shyam');
            mp.put(1211,'Rajesh');
            mp.put(1255,'Kiran');
            
            System.debug('---------------Elements in the map are ------------>'+mp);
            System.debug('---------------Size of the map is-------4---------->'+mp.size());
            System.debug('------------Keys in the map are ----------->'+mp.keyset());
            System.debug('------------Values in the map are ----------->'+mp.values());
            
            System.debug('------------------'+mp.get(1211));
            
            mp.remove(1226);
            
            mp.put(1211,'Charan');
            mp.put(1248,'Pavan');
            mp.put(1222,'Kiran');
            
            System.debug('---------------Elements in the map are ------------>'+mp);
            System.debug('---------------Size of the map is-------5---------->'+mp.size());
            
            for(Integer i : mp.keyset()){
                System.debug('-----Key--------'+i);
                System.debug('-----value---------'+mp.get(i));
            }
            
            for(String s: mp.values()){
                System.debug('----------------'+s);
            }
            
        }        
}