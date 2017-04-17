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

        protected void CreateAddressPoint(string address, string city, decimal longitude, decimal latitude)
        {
            bool isExist = rshEntities.AddressPoint.Any(u => u.Address == address);
            if (!isExist)
            {
                AddressPoint ap = new AddressPoint();
                ap.Address = address;
                ap.City = city;
                ap.Longitute = longitude;
                ap.Latitude = latitude;
                rshEntities.AddressPoint.Add(ap);
            }
        }
    }
}
