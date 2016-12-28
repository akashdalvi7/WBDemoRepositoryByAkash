public class TestPageController {   

    public TestPageController(){

    }

    public List<gaugeData> getData() {
        double NPS_score = 0;
        Opportunity score = [Select Id, Name, Amount  From Opportunity Where Amount>1000];

        List<gaugeData> data = new List<gaugeData>();
        data.add(new gaugeData('Amount', score.Amount));
        return data;
    }
    public class gaugeData {
        public String name { get; set; }
        public decimal score { get; set; }
        public decimal lowRange { get; set; }
        public decimal highRange { get; set; }

        public gaugeData(String name, decimal npsScore) {
            this.name = name;
            this.lowRange = 17;
            this.highRange = 30;
            this.score = npsScore;
        }
    }
}