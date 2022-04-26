using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Tennis.Models
{
   
    public class MatchDetails
    {
        [Key]
        public int Id { get; set; }
        public int MatId { get; set; }
        public string? UserId { get; set; }
        [Required(ErrorMessage = "Name is required")]
        [Display(Name = "Your player")]
        public string yourPlayer { get; set; }
        [Required(ErrorMessage = "Name is required")]
        [Display(Name = "Opponent")]
        public string opponentPlayer { get; set; }
        [Display(Name = "Event")]
        public string? Event { get; set; }
        [DataType(DataType.Date)]
        [Display(Name = "Date")]
        public string? date { get; set; }

    }
    
}
