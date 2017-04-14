using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RedShowHome.Models
{
    public class HouseModel
    {
    }

    public class HouseInfo
    {
        public string HouseID { get; set; }
        public string Address { get; set; }
        public int Status { get; set; }
        public double Area { get; set; }
        public int HouseType { get; set; }
        public int DecorationWay { get; set; }
        public string Description { get; set; }
        public string Ichnography { get; set; }
        public string FormatInfo { get; set; }
    }
}