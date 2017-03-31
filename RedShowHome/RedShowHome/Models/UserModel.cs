using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using RedShowHome.Models;

namespace RedShowHome.Models
{
    public class UserModel
    {
        public void test()
        {
        }
    }


    public class MapPoint
    {
        //根据后台数据库Adress传至前台解析
        public string Address { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string Longitude { get; set; }
        public string Latitude { get; set; }
    }
}