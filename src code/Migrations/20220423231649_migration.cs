using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Tennis.Migrations
{
    public partial class migration : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "ReportStats",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    MatId = table.Column<int>(type: "int", nullable: true),
                    FirstPlayer = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    SecondPlayer = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    fServeIN = table.Column<double>(type: "float", nullable: false),
                    fServeOUT = table.Column<double>(type: "float", nullable: false),
                    fServePerc = table.Column<double>(type: "float", nullable: false),
                    fServeINOP = table.Column<double>(type: "float", nullable: false),
                    fServeOUTOP = table.Column<double>(type: "float", nullable: false),
                    fServePercOP = table.Column<double>(type: "float", nullable: false),
                    sServeIN = table.Column<double>(type: "float", nullable: false),
                    sServeOUT = table.Column<double>(type: "float", nullable: false),
                    sServePerc = table.Column<double>(type: "float", nullable: false),
                    sServeINOP = table.Column<double>(type: "float", nullable: false),
                    sServePercOP = table.Column<double>(type: "float", nullable: false),
                    doubleFaults = table.Column<double>(type: "float", nullable: false),
                    fw = table.Column<double>(type: "float", nullable: false),
                    ft = table.Column<double>(type: "float", nullable: false),
                    fb = table.Column<double>(type: "float", nullable: false),
                    sw = table.Column<double>(type: "float", nullable: false),
                    st = table.Column<double>(type: "float", nullable: false),
                    sb = table.Column<double>(type: "float", nullable: false),
                    totalWinner = table.Column<double>(type: "float", nullable: false),
                    winnerPerc = table.Column<double>(type: "float", nullable: false),
                    winnerFHI = table.Column<double>(type: "float", nullable: false),
                    winnerFHO = table.Column<double>(type: "float", nullable: false),
                    winnerFHN = table.Column<double>(type: "float", nullable: false),
                    winnerBHI = table.Column<double>(type: "float", nullable: false),
                    winnerBHO = table.Column<double>(type: "float", nullable: false),
                    winnerBHN = table.Column<double>(type: "float", nullable: false),
                    totalWinnerOP = table.Column<double>(type: "float", nullable: false),
                    winnerPercOP = table.Column<double>(type: "float", nullable: false),
                    totalUE = table.Column<double>(type: "float", nullable: false),
                    UEPerc = table.Column<double>(type: "float", nullable: false),
                    ueFHI = table.Column<double>(type: "float", nullable: false),
                    ueFHO = table.Column<double>(type: "float", nullable: false),
                    ueFHN = table.Column<double>(type: "float", nullable: false),
                    ueBHI = table.Column<double>(type: "float", nullable: false),
                    ueBHO = table.Column<double>(type: "float", nullable: false),
                    ueBHN = table.Column<double>(type: "float", nullable: false),
                    totalUEOP = table.Column<double>(type: "float", nullable: false),
                    UEPercOP = table.Column<double>(type: "float", nullable: false),
                    netError = table.Column<double>(type: "float", nullable: false),
                    netErrorPerc = table.Column<double>(type: "float", nullable: false),
                    netErrorOP = table.Column<double>(type: "float", nullable: false),
                    netErrorPercOP = table.Column<double>(type: "float", nullable: false),
                    spowf = table.Column<double>(type: "float", nullable: false),
                    spowb = table.Column<double>(type: "float", nullable: false),
                    spoef = table.Column<double>(type: "float", nullable: false),
                    spoeb = table.Column<double>(type: "float", nullable: false),
                    rpowf = table.Column<double>(type: "float", nullable: false),
                    rpowb = table.Column<double>(type: "float", nullable: false),
                    rpoef = table.Column<double>(type: "float", nullable: false),
                    rpoeb = table.Column<double>(type: "float", nullable: false),
                    MatchId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ReportStats", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ReportStats_Match_MatchId",
                        column: x => x.MatchId,
                        principalTable: "Match",
                        principalColumn: "Id");
                });

           

            migrationBuilder.CreateIndex(
                name: "IX_ReportStats_MatchId",
                table: "ReportStats",
                column: "MatchId");

        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            
            migrationBuilder.DropTable(
                name: "ReportStats");

           
        }
    }
}
