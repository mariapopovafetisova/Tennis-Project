using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Tennis.Models
{
    public class pointListSP
    {
        [Key]
        public int Id { get; set; }
        public int PlayerId { get; set; }
        public int? point { get; set; }
        public string? fSerror { get; set; }
        public string? sSerror { get; set; }
        public string? winner { get; set; }
        public string? uError { get; set; }
        public string? NetError { get; set; }
    }
    public class ErrorsSP
    {


        [Key]
        public int Id { get; set; }
        //public int? SharedId { get; set; }
        //public IEnumerable<MatchInfo> mI { get; set; }
    
        public List<pointListSP>? pointListSP { get; set; }
        public int point { get; set; }
   
        public int? game { get; set; }

        public int? set { get; set; }

       
    }
}

