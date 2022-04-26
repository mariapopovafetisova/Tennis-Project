using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Tennis.Models
{
    public class FirstPlayer
    {
        [Key]
        public int Id { get; set; }
        //public int? MatId { get; set; }
        public string? UserId { get; set; }
        public List<ErrorsFP> errorList { get; set; }
        
        public string name { get; set; }

       
    }
    
}
