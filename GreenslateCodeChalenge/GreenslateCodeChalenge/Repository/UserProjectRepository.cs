using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GreenslateCodeChalenge.Repository
{
    public class UserProjectRepository
    {
        private GreenslateEntities context;

        public UserProjectRepository()
        {
            context = new GreenslateEntities();
        }

        public List<User> GetUsers()
        {
            return context.User.ToList();
        }

        public List<Project> GetProjectsByUser(int UserId)
        {
            return context.Project.Where(x => x.UserProject.Any(y => y.UserId == UserId)).ToList();
        }

        public UserProject GetUserProjectDetails(int UserId, int ProjectId)
        {
            return context.UserProject.Where(x => x.ProjectId == ProjectId && x.UserId == UserId).FirstOrDefault();
        }
    }
}