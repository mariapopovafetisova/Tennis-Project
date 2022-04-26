using Microsoft.AspNetCore.Identity;
namespace Tennis.Models
{
    public class UserProfile : IdentityUser
    {
        //private DateTime _date = DateTime.Now;
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public List<Match> Match { get; set; }
       
        //public DateTime DateCreated { get { return _date; } set { _date = value; } }
    }
    
}
