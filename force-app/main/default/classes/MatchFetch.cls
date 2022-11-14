public class MatchFetch {
    public static void createMatches() {
        
        // Assuming that this is the response that the API sends
        String body = '{"matchInfo":{"matchId":42986,"seriesId":3961,"seriesName":"ICC Mens T20 World Cup 2022","matchDesc":"1st Match, Group A","matchFormat":"T20","startDate":"1665892800000","endDate":"1665905400000","state":"Complete","status":"Namibia won by 55 runs"}}';
        matchInfoJson md = (matchInfoJson) JSON.deserialize(body, matchInfoJson.class);
        system.debug('md :'+md);
        
    }
    public class matchInfo{
        public integer matchId;
        public integer seriesId;
        public string seriesName;
        public string matchDesc;
        public string matchFormat;
        public string state;
        public string status;
    }
    
}