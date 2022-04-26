
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Tennis.Models
{
    public class RegistrationForm
    {
        [Key]
        public int Id { get; set; }
        
        [StringLength(20)]
        [Required(ErrorMessage = "First name is required")]
        public string firstName { get; set; }
        
        [StringLength(20)]
        [Required(ErrorMessage = "Last name is required")]
        public string lastName { get; set; }
        [Required]
        [EmailAddress(ErrorMessage = "Invalid email address")]
        public string email { get; set; }
        [StringLength(10)]
        [Required(ErrorMessage = "Username is required")]
        public string username { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [RegularExpression("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{6,20}$", ErrorMessage = "Password must contain at least one upper case, one lower case and one digit. ")]
        public string password { get; set; }

        [Required]
        [Display(Name = "Password")]
        [DataType(DataType.Password)]
        [DisplayName("Re-enter password")]

        public string comparePassword { get; set; }
    }
}
