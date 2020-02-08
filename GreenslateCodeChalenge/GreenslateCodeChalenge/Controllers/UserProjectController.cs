using GreenslateCodeChalenge.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GreenslateCodeChalenge.Controllers
{
    public class UserProjectController : Controller
    {
        UserProjectRepository repository = new UserProjectRepository();

        // GET: UserProject
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult GetUsers()
        {
            var Users = repository.GetUsers();
            return Json(Users.Select(x => new {
                x.UserId,
                x.FirstName,
                x.LastName
            }).ToList(), JsonRequestBehavior.AllowGet); ;
        }

        [HttpGet]
        public ActionResult GetProjects(int UserId)
        {
            var Projects = repository.GetProjectsByUser(UserId);
            return Json(Projects.Select(x => new {
                x.ProjectId,
                x.StartDate,
                x.EndDate,
                x.Credits,
                repository.GetUserProjectDetails(UserId, x.ProjectId).IsActive,
                TimeToStart = GetTimeToStart(x.StartDate, repository.GetUserProjectDetails(UserId, x.ProjectId).AssignedDate)
            }), JsonRequestBehavior.AllowGet);
        }

        private double GetTimeToStart(DateTime StartDate, DateTime AssignedDate)
        {
            return (StartDate - AssignedDate).TotalDays;
        }
    }
}