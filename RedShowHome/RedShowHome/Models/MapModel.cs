using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RedShowHome.Models
{
    public class MapModel
    {
    }

    public class MapPoint
    {
        //根据后台数据库Adress传至前台解析
        public int Type { get; set; }
        public string Id { get; set; }
        public string Address { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public decimal Longitude { get; set; }
        public decimal Latitude { get; set; }
    }
}