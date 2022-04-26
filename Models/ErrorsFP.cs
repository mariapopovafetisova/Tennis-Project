using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Tennis.Models
{
    public class pointListFP
    {
        [Key]
        public int Id { get; set; }
        public int PlayerId { get; set; }
        public int? point { get; set; }
        public string? fSerror { get; set; }
        public string? area { get; set; }
        public string? sSError { get; set; }

        public string? sPOError { get; set; }
        public string? rPOError { get; set; }
        public string? winner { get; set; }
        public string? winnerA { get; set; }
        public string? uError { get; set; }
        public string? uErrorA { get; set; }

        public string? NetError { get; set; }

    }
    public class ErrorsFP
    {
        [Key]
        public int Id { get; set; }

        public List<pointListFP>? pointList { get; set; }
        public int point { get; set; }
        public int? game { get; set; }
        public int? set { get; set; }

    }
}

