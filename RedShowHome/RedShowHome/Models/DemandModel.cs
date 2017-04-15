using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RedShowHome.Models
{
    public class DemandModel
    {
    }

    public class DemandInfo:HouseInfo
    {
        public string DemandID { get; set; }
        public string DemandName { get; set; }
    }
}