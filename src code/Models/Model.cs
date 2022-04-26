using System.ComponentModel.DataAnnotations;

namespace Tennis.Models
{
    public class Model
    {
        [Key]
        public int Id { get; set; }
        public string server { get; set; }
        public string btnValue { get; set; }
        public int point { get; set; }
        public int pointOP { get; set; }
        public int? game { get; set; }
        public int? games { get; set; }
        public int? gameOP { get; set; }
        public int? set { get; set; }
        public int? setOP { get; set; }
        public string firstServe { get; set; }
        public string secondServe { get; set; }
        public string? WBT { get; set; }
        public string? sPlusOne { get; set; }
        public string? rPlusOne { get; set; }
        public string? winner { get; set; }
        public string? winnerA { get; set; }
        public string? uError { get; set; }
        public string? uErrorA { get; set; }
        public string? netError { get; set; }
        public string firstServeOP { get; set; }
        public string secondServeOP { get; set; }
        public string? winnerOP { get; set; }
        public string? uErrorOP { get; set; }
        public string? netErrorOP { get; set; }
       
        

        
    }
}
