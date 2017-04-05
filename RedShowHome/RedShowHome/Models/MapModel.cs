using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RedShowHome.Models
{
    public class MapModel
    {
        public static double GetInstance(MapPoint mp1, MapPoint mp2)
        {
            return GetInstance(mp1.Longitude, mp1.Latitude, mp2.Longitude, mp2.Latitude);
        }

        public static double GetInstance(string lon1, string lat1, string lon2, string lat2)
        {
            double Lon1, Lat1, Lon2, Lat2;
            Lon1 = double.Parse(lon1);
            Lat1 = double.Parse(lat1);
            Lon2 = double.Parse(lon2);
            Lat2 = double.Parse(lat2);
            double instance = Math.Pow(Lon1 - Lon2, 2) + Math.Pow(Lat1 - Lat2, 2);
            return instance;
        }
    }
}