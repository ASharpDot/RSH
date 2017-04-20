using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using RedShowHome.Models;
using RedShowHome.Models.Context;

namespace RedShowHome.Controllers
{
    public class DemandController : BaseController
    {
        public const string HouseUploadFilePath = @"E:\RSH\House\";
        public const string EPath = @"E:\";
        public const string HouseInfoFormat = "建筑面积：{0} m²&nbsp;&nbsp;户型：{1}&nbsp;&nbsp;装修状态：{2}<br/>" +
                                              "地址：{3}<br/>" +
                                              "装修方式：{4}<br/>" +
                                              "详细信息：{5}";
        public const string DemandInfoFormat = "标题：{6}<br/>" +
                                               "建筑面积：{0} m²&nbsp;&nbsp;户型：{1}&nbsp;&nbsp;装修状态：{2}<br/>" +
                                              "地址：{3}<br/>" +
                                              "装修方式：{4}<br/>" +
                                              "详细信息：{5}";
        public const string DemandMapPointInfoFormat = "建筑面积：{0} m²&nbsp;&nbsp;户型：{1}&nbsp;&nbsp;装修状态：{2}<br/>" +
                                                       "地址：{3}<br/>" +
                                                       "装修方式：{4}<br/>" +
                                                       "详细信息：{5}";
        #region 枚举型数据转换

        private string ConvertHouseStatus(int status)
        {
            switch (status)
            {
                case 1:
                    return "准备";
                case 2:
                    return "拆改";
                case 3:
                    return "水电";
                case 4:
                    return "泥木";
                case 5:
                    return "油漆";
                case 6:
                    return "竣工";
                case 7:
                    return "软装";
                case 8:
                    return "入住";
                default:
                    return "无";
            }
        }

        private string ConvertHouseType(int type)
        {
            switch (type)
            {
                case 1:
                    return "一居室";
                case 2:
                    return "二居室";
                case 3:
                    return "三居室";
                case 4:
                    return "四居室";
                case 5:
                    return "小户型";
                case 6:
                    return "公寓";
                case 7:
                    return "复式";
                case 8:
                    return "别墅";
                case 9:
                    return "其他";
                default:
                    return "无";
            }
        }

        private string ConvertDecorationWay(int way)
        {
            switch (way)
            {
                case 1:
                    return "清包";
                case 2:
                    return "半包";
                case 3:
                    return "全包";
                default:
                    return "无";
            }
        }

        #endregion

        public ActionResult Index()
        {
            var userID = ContextHelper.GetCurrent().GetItem(Constant.UserID);
            if (userID == "")
                return RedirectToAction("Login", "User");
            return View();
        }

        public ActionResult AddHouse()
        {
            string ichnography = string.Empty;
            try
            {
                ichnography = Request.Params.Get(Constant.Ichnography);
                var userID = ContextHelper.GetCurrent().GetItem(Constant.UserID);
                if (userID == "")
                    throw new Exception("重新登录");
                RSH_House rh = new RSH_House();
                rh.HouseID = Guid.NewGuid().ToString();
                rh.Area = Convert.ToDouble(Request.Params.Get(Constant.Area));
                rh.HouseType = Convert.ToInt32(Request.Params.Get(Constant.HouseType));
                rh.Status = Convert.ToInt32(Request.Params.Get(Constant.Status));
                rh.DecorationWay = Convert.ToInt32(Request.Params.Get(Constant.DecorationWay));
                rh.Address = Request.Params.Get(Constant.Address);
                CreateAddressPoint(Request.Params.Get(Constant.Address), Request.Params.Get(Constant.City), Convert.ToDecimal(Request.Params.Get(Constant.Longitude)),
                    Convert.ToDecimal(Request.Params.Get(Constant.Latitude)));
                rh.Description = Request.Params.Get(Constant.Description);
                rh.Ichnography = ichnography;
                rh.Valid = "1";
                HouseOwner ho = new HouseOwner();
                ho.HouseID = rh.HouseID;
                ho.UserID = userID;
                ho.Valid = "1";
                rshEntities.RSH_House.Add(rh);
                rshEntities.HouseOwner.Add(ho);
                rshEntities.SaveChanges();
            }
            catch (Exception ex)
            {
                if (System.IO.File.Exists(ichnography))
                    System.IO.File.Delete(ichnography);
            }
            return Json(true);
        }

        public ActionResult GetAllHouse()
        {
            try
            {
                string userID = ContextHelper.GetCurrent().GetItem(Constant.UserID);
                if (userID != "")
                {
                    List<HouseInfo> houseInfoList = new List<HouseInfo>();
                    GetAllHouse(houseInfoList, userID);
                    return Json(houseInfoList);
                }
                return null;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public ActionResult Upload()
        {
            string imgPath = "";
            try
            {
                HttpFileCollection hfc = System.Web.HttpContext.Current.Request.Files;
                if (hfc.Count > 0)
                {
                    string newFileName = DateTime.Now.ToString("yyyyMMddhhmm") + "_" + Guid.NewGuid() + Path.GetExtension(hfc[0].FileName);
                    if (Directory.Exists(EPath))
                    {
                        if (!Directory.Exists(HouseUploadFilePath))
                            Directory.CreateDirectory(HouseUploadFilePath);
                        imgPath = Path.Combine(HouseUploadFilePath, newFileName);
                    }
                    else
                    {
                        imgPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, @"\RSH\House", newFileName);
                    }
                    hfc[0].SaveAs(imgPath);
                }
            }
            catch (Exception ex)
            {

            }
            return Json(new { FilePath = imgPath });
        }

        private void GetAllHouse(List<HouseInfo> houseInfoList, string userID)
        {
            var queryObjects = from h in rshEntities.RSH_House
                               from ho in rshEntities.HouseOwner
                               where ho.HouseID == h.HouseID && ho.Valid.Equals("1") && ho.UserID == userID && h.Valid.Equals("1")
                               select h;
            SetHouseList(houseInfoList, queryObjects);
        }

        private void SetHouseList(List<HouseInfo> houseInfoList, IQueryable<RSH_House> queryObjects)
        {
            foreach (var queryObject in queryObjects)
            {
                HouseInfo hi = new HouseInfo();
                hi.HouseID = queryObject.HouseID;
                hi.Address = queryObject.Address;
                hi.Area = queryObject.Area;
                hi.DecorationWay = queryObject.DecorationWay;
                hi.Description = queryObject.Description;
                hi.HouseType = queryObject.HouseType;
                hi.Status = queryObject.Status;
                hi.FormatInfo = string.Format(HouseInfoFormat, hi.Area, ConvertHouseType(hi.HouseType),
                    ConvertHouseStatus(hi.Status), hi.Address,
                    ConvertDecorationWay(hi.DecorationWay), hi.Description);
                hi.Ichnography = queryObject.Ichnography;//平面图Url
                houseInfoList.Add(hi);
            }
        }

        public ActionResult PublishDemand()
        {
            try
            {
                var userID = ContextHelper.GetCurrent().GetItem(Constant.UserID);
                if (userID == "")
                    return RedirectToAction("Login", "User");
                Demand de = new Demand();
                de.CreatorID = userID;
                de.DemandID = Guid.NewGuid().ToString();
                de.DemandName = Request.Params.Get(Constant.DemandName);
                de.HouseID = Request.Params.Get(Constant.HouseID);
                de.Valid = "1";
                de.Visible = "1";
                rshEntities.Demand.Add(de);
                rshEntities.SaveChanges();
            }
            catch (Exception ex)
            {

            }
            return Json(new { });
        }

        public ActionResult Demands()
        {
            return View();
        }

        //普通用户获取自己全部发布
        public ActionResult GetAllDemands()
        {
            var userID = ContextHelper.GetCurrent().GetItem(Constant.UserID);
            if (userID == "")
                return RedirectToAction("Login", "User");
            var queryObjects = from de in rshEntities.Demand
                where de.Valid == "1"
                      && de.CreatorID == userID
                select de;
            List<DemandInfo> demandList = new List<DemandInfo>();
            SetDemandList(demandList, queryObjects);
            return Json(demandList);
        }

        public ActionResult GetAllDemandsInSameCity()
        {

            try
            {
                List<MapPoint> mpList = new List<MapPoint>();
                string searchText = Request.Params.Get(Constant.SearchText) ?? "";
                string city = Request.Params.Get(Constant.City) ?? "";
                GetAllDemandsInSameCity(mpList, city);
                return Json(mpList);
            }
            catch (Exception)
            {
                return null;
            }
        }

        private void GetAllDemandsInSameCity(List<MapPoint> mpList, string city)
        {
            var queryObjects = from de in rshEntities.Demand
                               where de.Valid == "1" && de.Visible == "1"
                               select de;
            if (city != "" || city != "未知")
                queryObjects = from q in queryObjects
                    from ap in rshEntities.AddressPoint
                    from ho in rshEntities.RSH_House
                    where ap.Address == ho.Address && q.HouseID == ho.HouseID && ap.City == city
                    select q;
            SetDemandMapPointList(mpList, queryObjects);
        }

        private void SetDemandList(List<DemandInfo> demandList, IQueryable<Demand> queryObjects)
        {
            foreach (var queryObject in queryObjects)
            {
                DemandInfo info = new DemandInfo();
                string houseID= queryObject.HouseID;
                if (!string.IsNullOrEmpty(houseID))
                {
                    var house = (from h in rshEntities.RSH_House
                        where h.HouseID == houseID
                        select h).FirstOrDefault();
                    if (house != null)
                    {
                        info.DemandID = queryObject.DemandID;
                        info.DemandName = queryObject.DemandName;
                        info.HouseID = houseID;
                        info.Address = house.Address;
                        info.Area = house.Area;
                        info.DecorationWay = house.DecorationWay;
                        info.Description = house.Description;
                        info.HouseType = house.HouseType;
                        info.Status = house.Status;
                        info.FormatInfo = string.Format(DemandInfoFormat, info.Area, ConvertHouseType(info.HouseType),
                            ConvertHouseStatus(info.Status), info.Address,
                            ConvertDecorationWay(info.DecorationWay), info.Description,info.DemandName);
                        info.Ichnography = house.Ichnography; //平面图Url
                        demandList.Add(info);
                    }
                }
            }
        }

        private void SetDemandMapPointList(List<MapPoint> mpList, IQueryable<Demand> queryObjects)
        {
            foreach (var queryObject in queryObjects)
            {
                var house = rshEntities.RSH_House.FirstOrDefault(h => h.HouseID == queryObject.HouseID);
                if (house != null)
                {
                    var address = rshEntities.AddressPoint.FirstOrDefault(ap => ap.Address == house.Address);
                    MapPoint mp = new MapPoint();
                    mp.Id = queryObject.DemandID;
                    mp.Title = queryObject.DemandName;
                    mp.Type = 2;
                    mp.Description = string.Format(DemandMapPointInfoFormat, house.Area,
                        ConvertHouseType(house.HouseType),
                        ConvertHouseStatus(house.Status), house.Address,
                        ConvertDecorationWay(house.DecorationWay), house.Description);
                    mp.Address = address == null ? "" : address.Address;
                    mp.Longitude = address == null ? 0 : address.Longitute;
                    mp.Latitude = address == null ? 0 : address.Latitude;
                    mpList.Add(mp);
                }
            }
        }
    }
}
