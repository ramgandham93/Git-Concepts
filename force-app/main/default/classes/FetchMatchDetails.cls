public class FetchMatchDetails {
    public static List<Match__c> matchesList = new List<Match__c>();
    public static List<Team__c> teamsList = new List<Team__c>();
    public static void createMatchesDetails() {
        
        
        
        // Assuming that this is the response that the API sends
        String body = '{"matchDetails":[{"matchDetailsMap":{"key":"Sun, 16 Oct 2022","match":[{"matchInfo":{"matchId":42986,"seriesId":3961,"seriesName":"ICC Mens T20 World Cup 2022","matchDesc":"1st Match, Group A","matchFormat":"T20","startDate":"1665892800000","endDate":"1665905400000","state":"Complete","status":"Namibia won by 55 runs","team1":{"teamId":161,"teamName":"Namibia","teamSName":"NAM","imageId":172229},"team2":{"teamId":5,"teamName":"Sri Lanka","teamSName":"SL","imageId":172119}}},{"matchInfo":{"matchId":42991,"seriesId":3961,"seriesName":"ICC Mens T20 World Cup 2022","matchDesc":"2nd Match, Group A","matchFormat":"T20","startDate":"1665907200000","endDate":"1665919800000","state":"Complete","status":"Netherlands won by 3 wkts","team1":{"teamId":7,"teamName":"United Arab Emirates","teamSName":"UAE","imageId":172121},"team2":{"teamId":24,"teamName":"Netherlands","teamSName":"NED","imageId":172138}}}],"seriesId":3961}},{"matchDetailsMap":{"key":"Mon, 17 Oct 2022","match":[{"matchInfo":{"matchId":42996,"seriesId":3961,"seriesName":"ICC Mens T20 World Cup 2022","matchDesc":"3rd Match, Group B","matchFormat":"T20","startDate":"1665979200000","endDate":"1665991800000","state":"Complete","status":"Scotland won by 42 runs","team1":{"teamId":23,"teamName":"Scotland","teamSName":"SCO","imageId":172137},"team2":{"teamId":10,"teamName":"West Indies","teamSName":"WI","imageId":172124}}},{"matchInfo":{"matchId":43001,"seriesId":3961,"seriesName":"ICC Mens T20 World Cup 2022","matchDesc":"4th Match, Group B","matchFormat":"T20","startDate":"1665993600000","endDate":"1666006200000","state":"Complete","status":"Zimbabwe won by 31 runs","team1":{"teamId":12,"teamName":"Zimbabwe","teamSName":"ZIM","imageId":172127},"team2":{"teamId":27,"teamName":"Ireland","teamSName":"IRE","imageId":172141}}}],"seriesId":3961}},{"matchDetailsMap":{"key":"Tue, 18 Oct 2022","match":[{"matchInfo":{"matchId":43006,"seriesId":3961,"seriesName":"ICC Mens T20 World Cup 2022","matchDesc":"5th Match, Group A","matchFormat":"T20","startDate":"1666065600000","endDate":"1666078200000","state":"Complete","status":"Netherlands won by 5 wkts","team1":{"teamId":161,"teamName":"Namibia","teamSName":"NAM","imageId":172229},"team2":{"teamId":24,"teamName":"Netherlands","teamSName":"NED","imageId":172138}}},{"matchInfo":{"matchId":43011,"seriesId":3961,"seriesName":"ICC Mens T20 World Cup 2022","matchDesc":"6th Match, Group A","matchFormat":"T20","startDate":"1666080000000","endDate":"1666092600000","state":"Complete","status":"Sri Lanka won by 79 runs","team1":{"teamId":5,"teamName":"Sri Lanka","teamSName":"SL","imageId":172119},"team2":{"teamId":7,"teamName":"United Arab Emirates","teamSName":"UAE","imageId":172121}}}],"seriesId":3961}}],"landingPosition":32,"appIndex":{"seoTitle":"ICC Mens T20 World Cup 2022 live scores, schedule and results - Cricbuzz | Cricbuzz.com","webURL":"www.cricbuzz.com/cricket-series/"}}';
        Response md = (Response) JSON.deserialize(body, Response.class);
        system.debug('md :'+md);
        for(matchDetails mdts : md.matchDetails){
            List<Match> matches = mdts.matchDetailsMap.match;
            for(Match mt : matches){
                Integer matchId,seriesId;
                String seriesName,matchDesc,matchFormat,startDate,endDate,state,status;
                Id Team1;
                matchId = mt.MatchInfo.matchId;
                seriesId = mt.MatchInfo.seriesId;
                seriesName = mt.MatchInfo.seriesName;
                matchDesc = mt.MatchInfo.matchDesc;
                matchFormat = mt.MatchInfo.matchFormat;    
                startDate = mt.MatchInfo.startDate;    
                endDate = mt.MatchInfo.endDate;
                state = mt.MatchInfo.state;
                status  = mt.MatchInfo.status;
                createMatchRecords(matchId,seriesId,seriesName,matchDesc,matchFormat,startDate,endDate,state,status,Team1);
                    }
        }
        insert matchesList;
        
        for(matchDetails mdt : md.matchDetails){
            List<match> matchesLst = mdt.matchDetailsMap.Match;
            for(match mi :matchesLst){
                
                Team__c tm = new Team__c();
                tm.imageId__c = mi.matchInfo.team1.imageId;
                tm.teamId__c = mi.matchInfo.team1.teamId;
                tm.teamName__c = mi.matchInfo.team1.teamName;
                tm.teamSName__c = mi.matchInfo.team1.teamSName;
                teamsList.add(tm);
            }
        }
        insert teamsList;
        
        
    }
    public static void createMatchRecords(Integer matchId,Integer seriesId,String seriesName,String matchDesc,String matchFormat,String startDate,String endDate,String state,String status,Id Team1){
        integer i = 0;
        String teamId = matchesList.get(i).id;
        Match__c mat = new Match__c();
        mat.matchId__c = matchId;
        mat.seriesId__c = seriesId;
        mat.seriesName__c = seriesName;
        mat.matchDesc__c = matchDesc;
        mat.matchFormat__c = matchFormat;
        mat.Start_Date__c = startDate;
        mat.End_Date__c = endDate;
        mat.state__c = state;
        mat.status__c = status;
        mat.Team1__c = teamId;
        matchesList.add(mat);
    }
   
    
    public class Response{
        public List<matchDetails> matchDetails;
    }
    public class MatchDetails {
        public MatchDetailsMap matchDetailsMap;
    }
    public class MatchDetailsMap {
        public String key;
        public List<Match> match;
        public Integer seriesId;
    }
    public class Match {
        public MatchInfo matchInfo;
    }
    
    public List<MatchDetails> matchDetails;
    
    public class MatchInfo {
        public Integer matchId;
        public Integer seriesId;
        public String seriesName;
        public String matchDesc;
        public String matchFormat;
        public String startDate;
        public String endDate;
        public String state;
        public String status;
        public Team1 team1;
        public Team1 team2;
    }
    
    public class Team1 {
        public Integer teamId;
        public String teamName;
        public String teamSName;
        public Integer imageId;
    }
    
}