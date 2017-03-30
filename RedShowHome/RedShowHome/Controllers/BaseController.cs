using RedShowHome.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RedShowHome.Controllers
{
    public class BaseController : Controller
    {
        protected RedShowHomeEntities rshEntities = new RedShowHomeEntities();

    }
}
