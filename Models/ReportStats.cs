using System.ComponentModel.DataAnnotations;

namespace Tennis.Models
{
    public class ReportStats
    {
        [Key]
        public int Id { get; set; }
        public string UserId { get; set; }
        public int? MatId { get; set; }
        public string FirstPlayer { get; set; }
        public string SecondPlayer { get; set; }
        public double fServeIN { get; set; }
        public double fServeOUT { get; set; }
        public double fServePerc { get; set; }
        public double fServeINOP { get; set; }
        public double fServeOUTOP { get; set; }
        public double fServePercOP { get; set; }
        public double sServeIN { get; set; }
        public double sServeOUT { get; set; }
        public double sServePerc { get; set; }
        public double sServeINOP { get; set; }
        public double sServePercOP { get; set; }
        public double doubleFaults  {get;set;}
        public double fw { get; set; }
        public double ft { get; set; }
        public double fb { get; set; }
        public double sw { get; set; }
        public double st { get; set; }
        public double sb { get; set; }
        public double totalWinner { get; set; }
        public double winnerPerc { get; set; }
        public double winnerFHI { get; set; }
        public double winnerFHO { get; set; }
        public double winnerFHN { get; set; }
        public double winnerBHI { get; set; }
        public double winnerBHO { get; set; }
        public double winnerBHN { get; set; }
        public double totalWinnerOP { get; set; }
        public double winnerPercOP { get; set; }
        public double totalUE { get; set; }
        public double UEPerc { get; set; }
        public double ueFHI { get; set; }
        public double ueFHO { get; set; }
        public double ueFHN { get; set; }
        public double ueBHI { get; set; }
        public double ueBHO { get; set; }
        public double ueBHN { get; set; }
        public double totalUEOP { get; set; }
        public double UEPercOP { get; set; }
        public double netError { get; set; }
        public double netErrorPerc { get; set; }
        public double netErrorOP { get; set; }
        public double netErrorPercOP { get; set; }
        public double spowf { get; set; }
        public double spowb { get; set; }
        public double spoef { get; set; }
        public double spoeb { get; set; }
        public double rpowf { get; set; }
        public double rpowb { get; set; }
        public double rpoef { get; set; }
        public double rpoeb { get; set; }
    }
}
