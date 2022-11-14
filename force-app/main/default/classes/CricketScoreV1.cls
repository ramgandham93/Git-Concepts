public class CricketScoreV1 {

    public static void printCricketScore() {
         /*Http h = new Http();
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint('/....');
        req.setMethod('GET');

        HttpResponse res = h.send(req);
        String body = res.getBody();
        */
        // Assuming that this is the response that the API sends
        String body = '{"matchDetails":[{"inningsId":1,"batsmanStriker":{"batBalls":6,"batDots":4,"batFours":0,"batId":576,"batName":"Rohit Sharma","batMins":12,"batRuns":7,"batSixes":1,"batStrikeRate":116.67},"batsmanNonStriker":{"batBalls":2,"batDots":0,"batFours":0,"batId":1413,"batName":"Virat Kohli","batMins":0,"batRuns":2,"batSixes":0,"batStrikeRate":100},"batTeam":{"teamId":2,"teamScore":19,"teamWkts":1},"bowlerStriker":{"bowlId":13273,"bowlName":"Bas de Leede","bowlMaidens":0,"bowlNoballs":0,"bowlOvs":0.2,"bowlRuns":1,"bowlWides":0,"bowlWkts":0,"bowlEcon":3},"bowlerNonStriker":{"bowlId":9357,"bowlName":"Paul van Meekeren","bowlMaidens":0,"bowlNoballs":0,"bowlOvs":1,"bowlRuns":9,"bowlWides":0,"bowlWkts":1,"bowlEcon":9},"overs":3.2,"recentOvsStats":"... 0 1 0 0  | 2 0 0 W 1 6  | 1 0","partnerShip":{"balls":4,"runs":8},"currentRunRate":5.7,"requiredRunRate":0,"lastWicket":"KL Rahul  lbw b van Meekeren 9(12)  - 11/1 in 2.4 ov.","matchScoreDetails":{"matchId":43096,"inningsScoreList":[{"inningsId":1,"batTeamId":2,"batTeamName":"IND","score":19,"wickets":1,"overs":3.2,"isDeclared":false,"isFollowOn":false,"ballNbr":20}],"tossResults":{"tossWinnerId":2,"tossWinnerName":"India","decision":"Batting"},"matchTeamInfo":[{"battingTeamId":2,"battingTeamShortName":"IND","bowlingTeamId":24,"bowlingTeamShortName":"NED"}],"isMatchNotCovered":false,"matchFormat":"T20","state":"In Progress","customStatus":"India opt to bat","highlightedTeamId":2},"latestPerformance":[{"runs":18,"wkts":1,"label":"Last 3 overs"}],"ppData":{"pp_1":{"ppId":78,"ppOversFrom":0.1,"ppOversTo":6,"ppType":"mandatory","runsScored":19}},"overSummaryList":[{"score":19,"wickets":1,"inningsId":1,"o_summary":"1 0 ","runs":1,"batStrikerIds":[576,1413],"batStrikerNames":["Rohit","Kohli"],"batStrikerRuns":7,"batStrikerBalls":6,"batNonStrikerIds":[],"batNonStrikerNames":[],"batNonStrikerRuns":2,"batNonStrikerBalls":2,"bowlIds":[13273],"bowlNames":["Bas de Leede"],"bowlOvers":0.2,"bowlMaidens":0,"bowlRuns":1,"bowlWickets":0,"timestamp":1666855575297,"overNum":3.2,"batTeamName":"IND","event":"over-break"},{"score":18,"wickets":1,"inningsId":1,"o_summary":"2 0 0 W 1 6 ","runs":9,"batStrikerIds":[576,1413,8733],"batStrikerNames":["Rohit","Kohli","Rahul"],"batStrikerRuns":7,"batStrikerBalls":5,"batNonStrikerIds":[],"batNonStrikerNames":[],"batNonStrikerRuns":1,"batNonStrikerBalls":1,"bowlIds":[9357],"bowlNames":["Paul van Meekeren"],"bowlOvers":1,"bowlMaidens":0,"bowlRuns":9,"bowlWickets":1,"timestamp":1666855461990,"overNum":2.6,"batTeamName":"IND","event":"over-break"},{"score":9,"wickets":0,"inningsId":1,"o_summary":"0 1 0 1 0 0 ","runs":2,"batStrikerIds":[576,8733],"batStrikerNames":["Rohit","Rahul"],"batStrikerRuns":1,"batStrikerBalls":4,"batNonStrikerRuns":7,"batNonStrikerBalls":8,"bowlIds":[15205],"bowlNames":["Tim Pringle"],"bowlOvers":1,"bowlMaidens":0,"bowlRuns":2,"bowlWickets":0,"timestamp":1666855152144,"overNum":1.6,"batTeamName":"IND","event":"over-break"},{"score":7,"wickets":0,"inningsId":1,"o_summary":"0 Wd 0 4 2 0 0 ","runs":7,"batStrikerIds":[8733],"batStrikerNames":["Rahul"],"batStrikerRuns":6,"batStrikerBalls":6,"batNonStrikerIds":[576],"batNonStrikerNames":["Rohit"],"batNonStrikerRuns":0,"batNonStrikerBalls":0,"bowlIds":[12783],"bowlNames":["Fred Klaassen"],"bowlOvers":1,"bowlMaidens":0,"bowlRuns":7,"bowlWickets":0,"timestamp":1666854964980,"overNum":0.6,"batTeamName":"IND","event":"over-break"}],"status":"India opt to bat","lastWicketScore":9,"remRunsToWin":0,"matchHeader":{"matchId":43096,"matchDescription":"23rd Match, Super 12 Group 2","matchFormat":"T20","matchType":"International","complete":false,"domestic":false,"matchStartTimestamp":1666854000000,"matchCompleteTimestamp":1666864800000,"dayNight":false,"year":2022,"state":"In Progress","status":"India opt to bat","tossResults":{"tossWinnerId":2,"tossWinnerName":"India","decision":"Batting"},"result":{"winningTeam":"","winByRuns":false,"winByInnings":false},"revisedTarget":{"reason":""},"playersOfTheMatch":[],"playersOfTheSeries":[],"matchTeamInfo":[{"battingTeamId":2,"battingTeamShortName":"IND","bowlingTeamId":24,"bowlingTeamShortName":"NED"}],"isMatchNotCovered":false,"team1":{"id":2,"name":"India","playerDetails":[],"shortName":"IND"},"team2":{"id":24,"name":"Netherlands","playerDetails":[],"shortName":"NED"},"seriesDesc":"ICC Mens T20 World Cup 2022","seriesId":3961,"seriesName":"ICC Mens T20 World Cup 2022"},"responseLastUpdated":1666855579}]}';
        // Deserialize the response
        Response res = (Response) JSON.deserialize(body, Response.class);
        system.debug('res :'+res);
        // Write logic here
        string batingTeamName;
        integer score;
        double overs;
        integer wickets;
        string batsmanName;
        integer batruns;
        string nonstrikerName;
        integer nonstrikerRuns;
        string bowlingName;
        for(IningsScoreList ingList : res.matchDetails){
            system.debug('ingList : '+ingList.matchScoreDetails);
            for(InningsScoreList ingsList :ingList.matchScoreDetails.inningsScoreList){
                system.debug('ingsList : '+ingsList);
                batingTeamName = ingsList.batTeamName;
                score = ingsList.score;
                overs = ingsList.overs;
                wickets = ingsList.wickets;
            }
        }
        for(IningsScoreList ingList : res.matchDetails){
            system.debug('batsmanStriker : '+ingList.batsmanStriker);
            batsmanName = ingList.batsmanStriker.batName;
            batruns = ingList.batsmanStriker.batRuns;
            nonstrikerName = ingList.batsmanNonStriker.batName;
            nonstrikerRuns = ingList.batsmanNonStriker.batRuns;
        }
        
        for(IningsScoreList ingList : res.matchDetails){
            for(MatchTeamInfo mti : ingList.matchScoreDetails.matchTeamInfo){
                system.debug('mti : '+mti);
                bowlingName = mti.bowlingTeamShortName;
            }
        }
        
                        system.debug('batingTeamName : ' + batingTeamName+' ' + score+'/' + wickets+' '+overs+'overs' + ' ( ' + batsmanName+ ' ' + batruns+ '*,' + ' ' + nonstrikerName+ ' ' + nonstrikerRuns+ ' ) ' + ' vs '+' '+bowlingName);
    }
    
    public class Response{
    public List<IningsScoreList> matchDetails;
    
}
    public class IningsScoreList{
    public integer inningsId;
    public BatsmanStriker batsmanStriker;
    public BatsmanNonStriker batsmanNonStriker;
    public BatTeam batTeam;
    public BowlerStriker bowlerStriker;
    public BowlerNonStriker bowlerNonStriker;
    public double overs;
    public string recentOvsStats;
    public PartnerShip partnerShip;
    public double currentRunRate;
    public double requiredRunRate;
    public string lastWicket;
    public MatchScoreDetails1 matchScoreDetails;
    public List<LatestPerformance> latestPerformance;
    public ppData1 ppData;
    public List<OverSummaryLis> overSummaryList;
    public string status;
    public integer lastWicketScore;
    public integer remRunsToWin;
    public MatchHeader matchHeader;
    public long responseLastUpdated;
    }
    public class BatsmanStriker{
        public integer batBalls;
        public integer batDots;
        public integer batFours;
        public integer batId;
        public string batName;
        public integer batMins;
        public integer batRuns;
        public integer batSixes;
        public double batStrikeRate;
    }
    
    public class BatsmanNonStriker{
        public integer batBalls;
        public integer batDots;
        public integer batFours;
        public integer batId;
        public string batName;
        public integer batMins;
        public integer batRuns;
        public integer batSixes;
        public double batStrikeRate;
    }
    
    public class BatTeam{
        public integer teamId;
        public integer teamScore;
        public integer teamWkts;
    }
    
    public class BowlerStriker{
        public integer bowlId;
        public string bowlName;
        public integer bowlMaidens;
        public integer bowlNoballs;
        public double bowlOvs;
        public integer bowlRuns;
        public integer bowlWides;
        public integer bowlWkts;
        public integer bowlEcon;
    }
    
    public class BowlerNonStriker{
        public integer bowlId;
        public string bowlName;
        public integer bowlMaidens;
        public integer bowlNoballs;
        public double bowlOvs;
        public integer bowlRuns;
        public integer bowlWides;
        public integer bowlWkts;
        public integer bowlEcon;
    }
    
    public class PartnerShip{
        public integer balls;
        public integer runs;
    }
    
    public class MatchScoreDetails1{
        public integer matchId;
        public List<InningsScoreList> inningsScoreList;
        public TossResul tossResults;
        public List<MatchTeamInfo> matchTeamInfo;
        public boolean isMatchNotCovered;
        public string matchFormat;
        public string state;
        public string customStatus;
        public integer highlightedTeamId;
        
    }
    
    public class InningsScoreList{
        public integer inningsId;
        public integer batTeamId;
        public string batTeamName;
        public integer score;
        public integer wickets;
        public double overs;
        public boolean isDeclared;
        public boolean isFollowOn;
        public integer ballNbr;
    }
    
    public class TossResul{
        public integer tossWinnerId;
        public string tossWinnerName;
        public string decision;
    }
    
    public class MatchTeamInfo{
        public integer battingTeamId;
        public string battingTeamShortName;
        public integer bowlingTeamId;
        public string bowlingTeamShortName;
    }
    
    public class LatestPerformance{
        public integer runs;
        public integer wkts;
        public string label;
    }
    
    public class ppData1{
        public Pp_1 pp_1;
    }
    
    public class Pp_1{
        public integer ppId;
        public double ppOversFrom;
        public integer ppOversTo;
        public string ppType;
        public integer runsScored;
    }
    
    public class OverSummaryLis{
        public integer score;
        public integer wickets;
        public integer inningsId;
        public string o_summary;
        public integer runs;
        public List<integer> batStrikerIds;
        public List<string> batStrikerNames;
        public integer batStrikerRuns;
        public integer batStrikerBalls;
        public List<integer> batNonStrikerIds;
        public List<string> batNonStrikerNames;
        //public integer batNonStrikerRuns;
        //public integer batNonStrikerBalls;
        public List<integer> bowlIds;
        public List<string> bowlNames;
        public double bowlOvers;
        public double bowlMaidens;
        public integer bowlRuns;
        public integer bowlWickets;
        public long timestamp;
        public double overNum;
        public string batTeamName;
        public string event;
    }
    
    /*public class BatNonStrikerIds{
    }
    
    public class BatNonStrikerNames{
    }*/
    
    public class MatchHeader{
        public integer matchId;
        public string matchDescription;
        public string matchFormat;
        public string matchType;
        public boolean complete;
        public boolean domestic;
        public long matchStartTimestamp;
        public long matchCompleteTimestamp;
        public boolean dayNight;
        public integer year;
        public string state;
        public string status;
        public TossResults tossResults;
        public Result result;
        public RevisedTarget revisedTarget;
        public List<PlayersOfTheMatch> playersOfTheMatch;
        public List<PlayersOfTheSeries> playersOfTheSeries;
        public List<MatchTeamIf> matchTeamInfo;
        public boolean isMatchNotCovered;
        public Team1 team1;
        public Team1 team2;
        public string seriesDesc;
        public integer seriesId;
        public string seriesName;
        
    }
    
    public class TossResults{
        public integer tossWinnerId;
        public string tossWinnerName;
        public string decision;
    }
    
    public class Result{
        public string winningTeam;
        public boolean winByRuns;
        public boolean winByInnings;
    }
    
    public class RevisedTarget{
        public string reason;
    }
    
    public class PlayersOfTheMatch{
    }
    
    public class PlayersOfTheSeries{
    }
    
    public class MatchTeamIf{
        public integer battingTeamId;
        public string battingTeamShortName;
        public integer bowlingTeamId;
        public string bowlingTeamShortName;
    }
    
    public class Team1{
        public integer id;
        public string name;
        public List<PlayerDetails> playerDetails;
        public string shortName;
    }
    
    public class PlayerDetails{
    }

    
}