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
            try
            {
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
                rh.Description = Request.Params.Get(Constant.Description);
                rh.Ichnography = Request.Params.Get(Constant.Ichnography);
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
                throw new Exception(ex.Message);
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


    }
}
