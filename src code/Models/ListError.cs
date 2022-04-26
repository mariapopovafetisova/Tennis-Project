using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Tennis.Models
{

    public class CheckBoxModel
    {
        [Key]
        public int Id { get; set; }
        [ForeignKey("SharedId")]
        public int SharedId { get; set; }

        public int Value { get; set; }
        public string Text { get; set; }
        public bool IsChecked { get; set; }
    }
 
    public class ListError
    {

        [Key]
        public int Id { get; set; }
        
       
        [NotMapped]
        public List<CheckBoxModel> fServe { get; set; }
        public List<CheckBoxModel> sServe { get; set; }
        public List<CheckBoxModel> ServeWBT { get; set; }
        public List<CheckBoxModel> ServeplusOneWEFB { get; set; }
        public List<CheckBoxModel> ReturnplusOneWEFB { get; set; }

        public List<CheckBoxModel> WinnerFBH { get; set; }


        public List<CheckBoxModel> UEFB { get; set; }
        public List<CheckBoxModel> NetError { get; set; }

        [NotMapped]
        public List<CheckBoxModel> opfServe { get; set; }
        public List<CheckBoxModel> opsServe { get; set; }
        public List<CheckBoxModel> opWinner { get; set; }


        public List<CheckBoxModel> opUE { get; set; }
        public List<CheckBoxModel> NetErrorOP { get; set; }



    }
}
