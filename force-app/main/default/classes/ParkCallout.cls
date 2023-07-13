public class ParkCallout {
   public static String[] getParksCountry(string country){
    parksServices.ParksImplPort ps = new parksServices.ParksImplPort();
    return ps.byCountry(country);
   }
}