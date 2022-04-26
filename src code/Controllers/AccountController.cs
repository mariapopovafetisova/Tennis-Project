using Tennis.Models;
using Microsoft.AspNetCore.Mvc;
using Tennis.Data;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Authorization;
using System.Security.Claims;

namespace Tennis.Controllers
{

    [Authorize]
    public class AccountController : Controller
    {
        private readonly IWebHostEnvironment _hostEnvironment;
        private readonly ApplicationDbContext _db;
        private readonly UserManager<UserProfile> _userManager;
        private readonly SignInManager<UserProfile> _signInManager;
        

        public AccountController(UserManager<UserProfile> userManager, SignInManager<UserProfile> signInManager, ApplicationDbContext db, IWebHostEnvironment hostEnvironment)

        {
            _userManager = userManager;
            _signInManager = signInManager;
            _db = db;
            this._hostEnvironment = hostEnvironment;

        }

        [HttpGet]
        [AllowAnonymous]
        public IActionResult Login()
        {
            LoginForm login = new LoginForm();


            return View(login);
        }

        //POST
        [HttpPost]
        [ValidateAntiForgeryToken]
        [AllowAnonymous]
        public async Task<ActionResult> Login(LoginForm Model)
        {
                if (ModelState.IsValid)
                {
                    var result = await _signInManager.PasswordSignInAsync(Model.Username, Model.Password, true, false);

                    if (result.Succeeded)
                    {

                        return RedirectToAction("Index", "Home");
                    }
                    ModelState.AddModelError(string.Empty, "Invalid Login Attempt");
                }
                return View(Model);
        }
         
          
        

        [HttpGet, AllowAnonymous]
        public IActionResult Registration()
        {
            RegistrationForm Model = new RegistrationForm();
            return View(Model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [AllowAnonymous]
        public async Task<IActionResult> Registration(RegistrationForm Model)
        {


            if (ModelState.IsValid)
            {
                if (Model.password != Model.comparePassword)
                {
                    ModelState.AddModelError("password", "Passwords do not match");
                    ModelState.AddModelError("comparePassword", "Passwords do not match");
                    return View(Model);
                }
                var userEmail = await _userManager.FindByEmailAsync(Model.email);
                var userUsername = await _userManager.FindByNameAsync(Model.username);
                if (userEmail == null && userUsername == null)
                {

                    var user = new UserProfile
                    {
                        UserName = Model.username,
                        NormalizedUserName = Model.email,
                        Email = Model.email,
                        FirstName = Model.firstName,
                        LastName = Model.lastName,
                        Match = new List<Match>()
                                                      
                        
                };
                    IdentityResult result = await _userManager.CreateAsync(user, Model.password);

                    if (result.Succeeded)
                    {

                        await _db.SaveChangesAsync();

                        await _signInManager.SignInAsync(user, isPersistent: false);

                        return RedirectToAction("Index", "Home");
                    }
                    else
                    {

                        foreach (var error in result.Errors)
                        {

                         
                            ModelState.AddModelError("comparePassword", error.Description);
                           
                        }
                    }
                }
                else
                {
                    if (userEmail != null) { ModelState.AddModelError("Email", "Email already exists."); return View(Model); }
                    else if (userUsername != null) { ModelState.AddModelError("Username", "Username already exists."); return View(Model); }

                }
            }
            return View(Model);

        }
        
        [HttpGet]
        public IActionResult Dashboard()
        {
            IEnumerable<UserProfile> UserP = _db.UserProfile.Where(x=>x.UserName==User.Identity.Name);
            
            List<MatchDetails> md = _db.MatchDetails.Where(x => x.UserId == User.FindFirstValue(ClaimTypes.NameIdentifier)).ToList();
            List<FirstPlayer> fp = _db.FirstPlayer.Where(x => x.UserId == User.FindFirstValue(ClaimTypes.NameIdentifier)).ToList();
            List<SecondPlayer> sp = _db.SecondPlayer.Where(x => x.UserId == User.FindFirstValue(ClaimTypes.NameIdentifier)).ToList();
            List<ReportStats> rp = _db.ReportStats.Where(x => x.UserId == User.FindFirstValue(ClaimTypes.NameIdentifier)).ToList();

            Match match = new Match()
            {
                UserId = User.FindFirstValue(ClaimTypes.NameIdentifier),
                MatchDetails = md,
                FirstPlayer = fp,
                SecondPlayer = sp,
                ReportStats = rp,
                
            };
            

            foreach (var item in UserP)
            {
                item.Match = new List<Match>();
                item.Match.Add(match);
                

            }
            _db.SaveChanges();

            ViewBag.TotalMatches = md.Count();



            return View(UserP);
        }
        
       
        
        [HttpPost]
        public async Task<IActionResult> Logout()
        {
            await _signInManager.SignOutAsync();
            return RedirectToAction("Index", "Home");
        }
        [HttpGet]
        public IActionResult ReportMatch(int id, int MatId)
        {
            IEnumerable<ReportStats> rp = _db.ReportStats.Where(x => x.UserId == User.FindFirstValue(ClaimTypes.NameIdentifier)).Where(x => x.MatId.Equals(MatId));

            if (id == 1)
            {
                foreach (var item in rp)
                {
                    ViewBag.winnerFHI = item.winnerFHI;
                    ViewBag.winnerFHO = item.winnerFHO;
                    ViewBag.winnerFHN = item.winnerFHN;

                    ViewBag.winnerBHI = item.winnerBHI;
                    ViewBag.winnerBHO = item.winnerBHO;
                    ViewBag.winnerBHN = item.winnerBHN;

                    return PartialView("Winner");
                }
            }
            if (id == 2)
            {
                foreach (var item in rp)
                {
                    ViewBag.ueFHI = item.ueFHI;
                    ViewBag.ueFHO = item.ueFHO;
                    ViewBag.ueFHN = item.ueFHN;

                    ViewBag.ueBHI = item.ueBHI;
                    ViewBag.ueO = item.ueBHO;
                    ViewBag.ueBHN = item.ueBHN;
                    return PartialView("UnforcedErrors");
                }
            }
            return View(rp);
        }
            [HttpPost]

        public IActionResult ReportMatch(int MatId)
        {

            IEnumerable<ReportStats> rp = _db.ReportStats.Where(x => x.UserId == User.FindFirstValue(ClaimTypes.NameIdentifier)).Where(x => x.MatId.Equals(MatId));
            return View(rp);
        
        }

    }
}
