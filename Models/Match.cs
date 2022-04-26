using System.ComponentModel.DataAnnotations;

namespace Tennis.Models
{
    public class Match
    {
        [Key]
        public int Id { get; set; }
        public string UserId { get; set; }
        public List<MatchDetails> MatchDetails { get; set; }
        public List<FirstPlayer> FirstPlayer { get; set; }
        public List<SecondPlayer> SecondPlayer { get; set; }
        public List<ReportStats> ReportStats { get; set; }
    }

}
