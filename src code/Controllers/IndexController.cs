using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Tennis.Data;
using Tennis.Models;
using Microsoft.AspNetCore.Identity;
using System.Security.Claims;


namespace Tennis.Controllers
{
   
[Authorize]
    public class IndexController : Controller
    {

        private readonly ApplicationDbContext _db;
        private readonly UserManager<UserProfile> userManager;
        private readonly SignInManager<UserProfile> signInManager;

        public IndexController(ApplicationDbContext db, UserManager<UserProfile> userManager, SignInManager<UserProfile> signInManager)
        {
            this.userManager = userManager;
            this.signInManager = signInManager;
            _db = db;
        }
        
    [AllowAnonymous]
        public IActionResult MatchDetails()
        {

            MatchDetails Model = new MatchDetails();

            return View(Model);


        }
        [AllowAnonymous]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult MatchDetails(MatchDetails Model)
        {


            if (ModelState.IsValid)
            {

                MatchDetails mi = new MatchDetails();

                mi.yourPlayer = Model.yourPlayer;
                mi.opponentPlayer = Model.opponentPlayer;
                mi.Event = Model.Event;
                mi.date = Model.date;


                HttpContext.Session.SetString("FPName", Model.yourPlayer);
                HttpContext.Session.SetString("SPName", Model.opponentPlayer);





                if (User.Identity.IsAuthenticated)
                {
                    mi.UserId = User.FindFirstValue(ClaimTypes.NameIdentifier);

                    _db.MatchDetails.Add(mi);
                    _db.SaveChanges();
                    mi.MatId = mi.Id;
                    HttpContext.Session.SetInt32("MDId", mi.MatId);
                    _db.SaveChanges();
                   

                    return RedirectToAction("Server");



                }



                _db.MatchDetails.Add(mi);
                _db.SaveChanges();
                
                
                return RedirectToAction("Server");

            }




            return View();
         
        }

        [HttpGet]
        [AllowAnonymous]
        public ActionResult Server()
        {
            IEnumerable<MatchDetails> Model=_db.MatchDetails;
            

            return View(Model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [AllowAnonymous]
        public ActionResult Server(string server)
        {
            pointListFP plfp = new pointListFP();
            pointListSP plsp = new pointListSP(); 
            ListError le = new ListError();
            ErrorsFP ypE = new ErrorsFP();
            ErrorsSP opE = new ErrorsSP();
                ypE.point = 0;
                opE.point = 0;
           
            List<pointListFP>pl = new List<pointListFP>();
                pl.Add(plfp);
                ypE.pointList = pl;

            List<pointListSP> pls = new List<pointListSP>();
                pls.Add(plsp);
                opE.pointListSP = pls;

            FirstPlayer yp = new FirstPlayer();             
                yp.name = HttpContext.Session.GetString("FPName");
                List<ErrorsFP> ypErrors = new List<ErrorsFP>();
                ypErrors.Add(ypE);
                yp.errorList = ypErrors;
            

            SecondPlayer op = new SecondPlayer();
                op.name = HttpContext.Session.GetString("SPName");
                List<ErrorsSP> opErrors = new List<ErrorsSP>();
                opErrors.Add(opE);
                op.errorList = opErrors;

            if (User.Identity.IsAuthenticated)
            {

                yp.UserId = User.FindFirstValue(ClaimTypes.NameIdentifier);
                op.UserId = User.FindFirstValue(ClaimTypes.NameIdentifier);


            }
            _db.FirstPlayer.Add(yp);
            _db.SecondPlayer.Add(op);
            _db.ErrorsFP.Add(ypE);
            _db.ErrorsSP.Add(opE);
            _db.SaveChanges();
            
            HttpContext.Session.SetInt32("FPId", yp.Id);
            HttpContext.Session.SetInt32("SPId", op.Id);
            HttpContext.Session.SetInt32("ErFPId", ypE.Id);
            HttpContext.Session.SetInt32("ErSPId", opE.Id);
            if (server == "firstPlayer")
            {
                HttpContext.Session.SetString("Server", server);
                
                _db.ListError.Add(le);
                _db.SaveChanges(); 
                HttpContext.Session.SetInt32("ServerId", le.Id);
                return RedirectToAction("Analyze");
            }
            if (server == "secondPlayer")
            {
              
                _db.ListError.Add(le);
                _db.SaveChanges();
                HttpContext.Session.SetString("Server", server); 
                HttpContext.Session.SetInt32("ServerId", le.Id);
                return RedirectToAction("Analyze");

            }
            else
            {
                return View(le);
           }
        }
        [AllowAnonymous]
        [HttpGet]
        public ActionResult Analyze()
        {

            IEnumerable<MatchDetails> md = _db.MatchDetails;
            IEnumerable<ErrorsFP> fp = _db.ErrorsFP;
            IEnumerable<ErrorsSP> sp = _db.ErrorsSP;

            if (HttpContext.Session.GetString("Server") == "firstPlayer")
            {
                ViewBag.Block = "block";
                ViewBag.None = "none";
            }else if(HttpContext.Session.GetString("Server") == "secondPlayer")
            {
                ViewBag.Block = "none";
                ViewBag.None = "block";
            }
            foreach (var item in fp.Where(x=>x.Id.Equals(HttpContext.Session.GetInt32("ErFPId"))))
            {
                ViewBag.Points = item.point;
            }
            foreach (var item in sp.Where(x => x.Id.Equals(HttpContext.Session.GetInt32("ErSPId"))))
            {
                ViewBag.PointsOP = item.point;
            }

            ListError ListError = new ListError();
           
           

            ViewBag.FP = HttpContext.Session.GetString("FPName");
            ViewBag.SP = HttpContext.Session.GetString("SPName");


            //Adding items to checkbox
            List<CheckBoxModel> firstS = new List<CheckBoxModel>()
            {
              new CheckBoxModel {Value=1,Text="Made",IsChecked=false },
              new CheckBoxModel {Value=2,Text="Missed",IsChecked=false}
              };

            List<CheckBoxModel> WBT = new List<CheckBoxModel>()
            {
              new CheckBoxModel {Value = 3, Text = "Wide", IsChecked = false },
              new CheckBoxModel {Value = 4, Text = "Body", IsChecked = false },
              new CheckBoxModel {Value = 5, Text = "T", IsChecked = false }};

            List<CheckBoxModel> secondS = new List<CheckBoxModel>()
            {
              new CheckBoxModel {Value=6,Text="Made",IsChecked=false },
              new CheckBoxModel {Value=7,Text="Missed",IsChecked=false }};

            List<CheckBoxModel> servePlusOneWEFB = new List<CheckBoxModel>()
            {
              new CheckBoxModel {Value=8,Text="Winner Forehand",IsChecked=false },
              new CheckBoxModel {Value=9,Text="Winner Backhand",IsChecked=false },
              new CheckBoxModel {Value=10,Text="Error Forehand",IsChecked=false },
              new CheckBoxModel {Value=11,Text="Error Backhand",IsChecked=false } };

            List<CheckBoxModel> returnPlusOneWEFB = new List<CheckBoxModel>()
            {
              new CheckBoxModel {Value=12,Text="Winner Forehand",IsChecked=false },
              new CheckBoxModel {Value=13,Text="Winner Backhand",IsChecked=false },
              new CheckBoxModel {Value=14,Text="Error Forehand",IsChecked=false },
              new CheckBoxModel {Value=15,Text="Error Backhand",IsChecked=false }};

            List<CheckBoxModel> winner = new List<CheckBoxModel>()
            {
              new CheckBoxModel {Value=16,Text="Forehand",IsChecked=false },
              new CheckBoxModel {Value=17,Text="Backhand",IsChecked=false },
              new CheckBoxModel {Value=18,Text="Outside",IsChecked=false },
              new CheckBoxModel {Value=19,Text="90",IsChecked=false },
              new CheckBoxModel {Value=20,Text="Inside",IsChecked=false }};

            List<CheckBoxModel> uError = new List<CheckBoxModel>()
            {
              new CheckBoxModel {Value=21,Text="Forehand",IsChecked=false },
              new CheckBoxModel {Value=22,Text="Backhand",IsChecked=false },
              new CheckBoxModel {Value=23,Text="Outside",IsChecked=false },
              new CheckBoxModel {Value=24,Text="90",IsChecked=false },
              new CheckBoxModel {Value=25,Text="Inside",IsChecked=false }};

            List<CheckBoxModel> NetError = new List<CheckBoxModel>()
            {
              new CheckBoxModel {Value=36,Text="Net Error",IsChecked=false }};

            //assigning records to the CheckBoxItems list 


            ListError.fServe = firstS;
            ListError.ServeWBT = WBT;
            ListError.sServe = secondS;
            ListError.ServeplusOneWEFB = servePlusOneWEFB;
            ListError.ReturnplusOneWEFB = returnPlusOneWEFB;
            ListError.WinnerFBH = winner;
            ListError.UEFB = uError;
            ListError.NetError = NetError;

            //opponent error
            List<CheckBoxModel> opfirstS = new List<CheckBoxModel>()
            {
              new CheckBoxModel {Value=27,Text="Made",IsChecked=false },
              new CheckBoxModel {Value=28,Text="Missed",IsChecked=false}};


            List<CheckBoxModel> opsecondS = new List<CheckBoxModel>()
            {
              new CheckBoxModel {Value=29,Text="Made",IsChecked=false },
              new CheckBoxModel {Value=30,Text="Missed",IsChecked=false }};

            List<CheckBoxModel> opWinner = new List<CheckBoxModel>()
            {
              new CheckBoxModel {Value=31,Text="Forehand",IsChecked=false },
              new CheckBoxModel {Value=32,Text="Backhand",IsChecked=false },
             };
            List<CheckBoxModel> opuError = new List<CheckBoxModel>()
            {
              new CheckBoxModel {Value=33,Text="Forehand",IsChecked=false },
              new CheckBoxModel {Value=34,Text="Backhand",IsChecked=false },

          };
            List<CheckBoxModel> NetErrorOP = new List<CheckBoxModel>()
            {
              new CheckBoxModel {Value=37,Text="Net Error",IsChecked=false }};

            ListError.opfServe = opfirstS;
            ListError.opsServe = opsecondS;
            ListError.opWinner = opWinner;
            ListError.opUE = opuError;
            ListError.NetErrorOP = NetErrorOP;
            
            
            _db.SaveChanges();

            HttpContext.Session.SetInt32("ListErrorId", ListError.Id);
            
                return View(ListError);

        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        [AllowAnonymous]
        [IgnoreAntiforgeryToken]

        public IActionResult AjaxPostCall([FromBody] Model data)
        {

           
            var db = _db.FirstPlayer.Where(x => x.Id.Equals(HttpContext.Session.GetInt32("FPId")));
            
            foreach (var item in db)
            {

                var id = item.Id;
                
                ErrorsFP ErrorsFP = new ErrorsFP();
                    ErrorsFP.point = data.point;
                    ErrorsFP.game = data.game;
                    ErrorsFP.set = data.set;
                    
                
            pointListFP pl = new pointListFP();
                    pl.point = data.point;
                    pl.fSerror = data.firstServe;
                    pl.area = data.WBT;
                    pl.sSError = data.secondServe;
                    pl.sPOError = data.sPlusOne;
                    pl.rPOError = data.rPlusOne;
                    pl.winner = data.winner;
                    pl.winnerA = data.winnerA;
                    pl.uError = data.uError;
                    pl.uErrorA = data.uErrorA;
                    pl.NetError = data.netError;
                    pl.PlayerId = id;
                
            var pointList = new List<pointListFP>();
            pointList.Add(pl);

               
                ErrorsFP.pointList = pointList;
                item.errorList = new List<ErrorsFP>();
                item.errorList.Add(ErrorsFP);
                _db.ErrorsFP.Add(ErrorsFP);
                _db.pointListFP.Add(pl);
            }



            var dbOP = _db.SecondPlayer.Where(x => x.Id.Equals(HttpContext.Session.GetInt32("SPId")));
            
            List<pointListSP> opList = new List<pointListSP>() {
                new pointListSP{
                                point=data.pointOP,
                                fSerror=data.firstServeOP,
                                sSerror= data.secondServeOP,
                                winner= data.winnerOP,
                                uError=data.netErrorOP

                }


            };            

            foreach (var item in dbOP)
            {
                var id = item.Id;
                ErrorsSP ErrorsSP = new ErrorsSP();  
                    ErrorsSP.point = data.pointOP;
                    ErrorsSP.game = data.gameOP;
                    ErrorsSP.set = data.setOP;
                pointListSP pl = new pointListSP();
                    pl.point = data.point;
                    pl.fSerror = data.firstServeOP;
                    pl.sSerror = data.secondServeOP;
                    pl.winner = data.winnerOP;
                    pl.uError = data.uErrorOP;
                    pl.NetError = data.netErrorOP;
                    pl.PlayerId = id;

                var pointList = new List<pointListSP>();
                pointList.Add(pl);
                ErrorsSP.pointListSP = pointList;
                item.errorList = new List<ErrorsSP>();
                item.errorList.Add(ErrorsSP);
                _db.ErrorsSP.Add(ErrorsSP);
                _db.pointListSP.Add(pl);
            }

            data.server= HttpContext.Session.GetString("Server");

            if (data.games == 1)
            {
                if (data.server == "firstPlayer")
                {
                    data.server = "secondPlayer";
                    HttpContext.Session.SetString("Server", data.server);
                }
                else if (data.server == "secondPlayer")
                {
                    data.server = "firstPlayer";
                    HttpContext.Session.SetString("Server", data.server);
                }
            }
            _db.SaveChanges();
            return Json(data);
        }









        [HttpGet]
        [AllowAnonymous]
        public  ActionResult Report(int Id)
        {

            ViewBag.FP = HttpContext.Session.GetString("FPName");
            ViewBag.SP = HttpContext.Session.GetString("SPName");
            var db = _db.pointListFP.Where(x => x.PlayerId.Equals(HttpContext.Session.GetInt32("FPId"))).ToList();//HttpContext.Session.GetInt32("FPId"))

            var dbOP = _db.pointListSP.Where(x => x.PlayerId.Equals(HttpContext.Session.GetInt32("SPId"))).ToList();//HttpContext.Session.SetInt32("FPId",

            //First serve stats
            double totalfs = db.Where(x => x.fSerror != null).Count();

            double totalfsOP = dbOP.Where(x => x.fSerror != null).Count();
            var tf = db.Where(x => x.fSerror != null);
            var tfop = dbOP.Where(x => x.fSerror != null);


            double madefs = tf.Where(x => x.fSerror.Contains("Made")).Count();
            double misfs = tf.Where(x => x.fSerror.Contains("Missed")).Count();
            ViewBag.fsIN = madefs;
            ViewBag.fsOUT = misfs;
            double percfs = (madefs / totalfs) * 100;
            var pfs = Math.Round(percfs, 0);
            ViewBag.percfs = pfs;

            int fw = tf.Where(x => x.fSerror.Contains("Made")).Where(x=>x.area.Contains("W")).Count();
            int fb = tf.Where(x => x.fSerror.Contains("Made")).Where(x => x.area.Contains("Body")).Count();
            int ft = tf.Where(x => x.fSerror.Contains("Made")).Where(x => x.area.Contains("T")).Count();
            ViewBag.fw = fw;
            ViewBag.fb = fb;
            ViewBag.ft = ft;

            double madefsop = tfop.Where(x => x.fSerror.Contains("Made")).Count();
            ViewBag.fsINOP = madefsop;
            double misfsop = tfop.Where(x => x.fSerror.Contains("Missed")).Count();
            ViewBag.fsOUTOP = misfsop;
            double percfsop = misfsop / totalfsOP * 100;
            var pfsop = Math.Round(percfsop, 0);
            ViewBag.percfsOP = pfsop;



            //Second serve stats

            var totalss = db.Where(x => x.sSError != null).Count();
            var ts = db.Where(x => x.sSError != null);

            var totalssOP = dbOP.Where(x => x.sSerror != null).Count();
            var tsop = dbOP.Where(x => x.sSerror != null);

            double madess = ts.Where(x => x.sSError.Contains("Made")).Count();

            double miss = ts.Where(x => x.sSError.Contains("Missed")).Count();
            ViewBag.ssOUT = miss;
            ViewBag.ssIN = madess;
            double percss = madess / totalss * 100;
            var pss = Math.Round(percss, 0);
            ViewBag.percss = pss;

            int sw = ts.Where(x => x.sSError.Contains("Made")).Where(x => x.area.Contains("W")).Count();
            int sb = ts.Where(x => x.sSError.Contains("Made")).Where(x => x.area.Contains("Body")).Count();
            int st = ts.Where(x => x.sSError.Contains("Made")).Where(x => x.area.Contains("T")).Count();
            ViewBag.sw = sw;
            ViewBag.sb = sb;
            ViewBag.st = st;

            double madessop = tsop.Where(x => x.sSerror.Contains("Made")).Count();
            ViewBag.ssINOP = madessop;
            double percssOP = madessop / totalssOP * 100;
            var pssop = Math.Round(percssOP, 0);
            ViewBag.percssOP = pssop;

            var doublefaults = ts.Where(x => x.fSerror.Contains("Missed")).Where(x => x.sSError.Contains("Missed")).Count();
            ViewBag.doublefaults = doublefaults;

            //Winners
            double totalpoints = db.Count();
            double totalwin = db.Where(x => x.winner != null).Count();
            var tw = db.Where(x => x.winner != null).Where(x => x.winnerA != null); ;

            double winner = totalwin / totalpoints * 100;
            var pwin = Math.Round(winner, 0);
            ViewBag.winner = pwin;
            ViewBag.totalwinner = totalwin;
            var winnerFHI = tw.Where(x => x.winner.Contains("Forehand")).Where(x => x.winnerA.Contains("Inside")).Count();
            var winnerFHO = tw.Where(x => x.winner.Contains("Forehand")).Where(x => x.winnerA.Contains("Outside")).Count();
            var winnerFHN = tw.Where(x => x.winner.Contains("Forehand")).Where(x => x.winnerA.Contains("90")).Count();

            var winnerBHI = tw.Where(x => x.winner.Contains("Backhand")).Where(x => x.winnerA.Contains("Inside")).Count();
            var winnerBHO = tw.Where(x => x.winner.Contains("Backhand")).Where(x => x.winnerA.Contains("Outside")).Count();
            var winnerBHN = tw.Where(x => x.winner.Contains("Backhand")).Where(x => x.winnerA.Contains("90")).Count();

            if (Id == 1)
            {
                ViewBag.winnerFHI = winnerFHI;
                ViewBag.winnerFHO = winnerFHO;
                ViewBag.winnerFHN = winnerFHN;

                ViewBag.winnerBHI = winnerBHI;
                ViewBag.winnerBHO = winnerBHO;
                ViewBag.winnerBHN = winnerBHN;

                return PartialView("Winner");
            }




            double totalwinOP = dbOP.Where(x => x.winner != null).Count();
            double winnerOP = totalwinOP / totalpoints * 100;
            var pwinop = Math.Round(winnerOP, 0);
            ViewBag.winnerOP = pwinop;
            ViewBag.totalwinnerOP = totalwinOP;

            //Unforced Errors

            double totalue = db.Where(x => x.uError != null).Count();
            var tue = db.Where(x => x.uError != null).Where(x => x.uErrorA != null);
            double ue = totalue / totalpoints * 100;
            var pue = Math.Round(ue, 0);
            ViewBag.ue = pue;
            ViewBag.totalue = totalue;

            var ueFHI = tue.Where(x => x.uError.Contains("Forehand")).Where(x => x.uErrorA.Contains("Inside")).Count();
            var ueFHO = tue.Where(x => x.uError.Contains("Forehand")).Where(x => x.uErrorA.Contains("Outside")).Count();
            var ueFHN = tue.Where(x => x.uError.Contains("Forehand")).Where(x => x.uErrorA.Contains("90")).Count();

            var ueBHI = tue.Where(x => x.uError.Contains("Backhand")).Where(x => x.uErrorA.Contains("Inside")).Count();
            var ueBHO = tue.Where(x => x.uError.Contains("Backhand")).Where(x => x.uErrorA.Contains("Outside")).Count();
            var ueBHN = tue.Where(x => x.uError.Contains("Backhand")).Where(x => x.uErrorA.Contains("90")).Count();
            if (Id == 2)
            {
                ViewBag.ueFHI = ueFHI;
                ViewBag.ueFHO = ueFHO;
                ViewBag.ueFHN = ueFHN;

                ViewBag.ueBHI = ueBHI;
                ViewBag.ueO = ueBHO;
                ViewBag.ueBHN = ueBHN;
                return PartialView("UnforcedErrors");
            }

            var totalueOP = dbOP.Where(x => x.uError != null).Count();
            var ueOP = totalueOP / totalpoints * 100;
            var pueop = Math.Round(ueOP, 0);
            ViewBag.ueOP = pueop;
            ViewBag.totalueOP = totalueOP;


            //Net Errors

            double neterrors = db.Where(x => x.NetError != null).Count();
            ViewBag.NetError = neterrors;
            double percne = neterrors / totalpoints * 100;
            var pne = Math.Round(percne, 0);
            ViewBag.percne = pne;

            double neterrorsop = dbOP.Where(x => x.NetError != null).Count();
            ViewBag.NetErrorOP = neterrorsop;
            double percneop = neterrorsop / totalpoints * 100;
            var pneop = Math.Round(percneop, 0);
            ViewBag.percneop = pneop;

            //Serve +1 

            var notnull = db.Where(x => x.sPOError != null);
            var spowf = notnull.Where(x => x.sPOError.Contains("Winner Forehand")).Count();
            var spowb = notnull.Where(x => x.sPOError.Contains("Winner Backhand")).Count();
            var spoef = notnull.Where(x => x.sPOError.Contains("Error Forehand")).Count();
            var spoeb = notnull.Where(x => x.sPOError.Contains("Error Backhand")).Count();

            ViewBag.spowf = spowf;
            ViewBag.spowb = spowb;
            ViewBag.spoef = spoef;
            ViewBag.spoeb = spoeb;
            //Return +1
            var notnull2 = db.Where(x => x.rPOError != null);
            var rpowf = notnull2.Where(x => x.rPOError.Contains("Winner Forehand")).Count();
            var rpowb = notnull2.Where(x => x.rPOError.Contains("Winner Backhand")).Count();
            var rpoef = notnull2.Where(x => x.rPOError.Contains("Error Forehand")).Count();
            var rpoeb = notnull2.Where(x => x.rPOError.Contains("Error Backhand")).Count();

            ViewBag.rpowf = rpowf;
            ViewBag.rpowb = rpowb;
            ViewBag.rpoef = rpoef;
            ViewBag.rpoeb = rpoeb;

            if (User.Identity.IsAuthenticated)
            {
                ReportStats rp = new ReportStats()
                {
                    UserId = User.FindFirstValue(ClaimTypes.NameIdentifier),
                    FirstPlayer = HttpContext.Session.GetString("FPName"),
                    SecondPlayer = HttpContext.Session.GetString("SPName"),
                    MatId= HttpContext.Session.GetInt32("MDId"),
                    fServeIN = madefs,
                    fServeOUT = misfs,
                    fServePerc = pfs,
                    fServeINOP = madefsop,
                    fServeOUTOP = misfsop,
                    fServePercOP = pfsop,
                    sServeIN = madess,
                    sServeOUT = miss,
                    sServePerc = pss,
                    sServeINOP = madessop,
                    sServePercOP = pssop,
                    doubleFaults = doublefaults,
                    fw = fw,
                    ft = ft,
                    fb = fb,
                    sw = sw,
                    st = st,
                    sb = sb,
                    totalWinner = totalwin,
                    winnerPerc = pwin,
                    winnerFHI = winnerFHI,
                    winnerFHO = winnerFHO,
                    winnerFHN = winnerFHN,
                    winnerBHI = winnerBHI,
                    winnerBHO = winnerBHO,
                    winnerBHN = winnerBHN,
                    totalWinnerOP = totalwinOP,
                    winnerPercOP = pwinop,
                    totalUE = totalue,
                    UEPerc = pue,
                    ueFHI = ueFHI,
                    ueFHO = ueFHO,
                    ueFHN = ueFHN,
                    ueBHI = ueBHI,
                    ueBHN = ueBHN,
                    ueBHO = ueBHO,
                    totalUEOP = totalueOP,
                    UEPercOP = pueop,
                    netError = neterrors,
                    netErrorPerc = pne,
                    netErrorOP = neterrorsop,
                    netErrorPercOP = pneop,
                    spowf = spowf,
                    spowb = spowb,
                    spoef = spoef,
                    spoeb = spoeb,
                    rpowf = rpowf,
                    rpowb = rpowb,
                    rpoef = rpoef,
                    rpoeb = rpoeb
                };

            
            HttpContext.Session.SetInt32("REPId", rp.Id);
           
            _db.ReportStats.Add(rp);
        } 
                
                

            _db.SaveChanges();

            return View();
        }
   
               
        


    }
}
