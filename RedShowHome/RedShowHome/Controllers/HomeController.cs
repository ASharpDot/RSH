using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.Mvc;
using RedShowHome.Models;
using WebGrease.Css.Ast.Selectors;

namespace RedShowHome.Controllers
{
    public class HomeController : BaseController
    {
        private const string DesignCompanyDescriptionFormat = "联系方式：{0}<br/>联系地址：<br/>\n公司信息：{2}";
        private const string DesignerDescriptionFormat = "性别：{0}<br/>联系方式：{1}<br/>联系地址：{2}<br/>工作经验：{3}年<br/>设计理念：{4}";
        private const string SellerDescriptionFormat = "联系方式：{0}<br/>联系地址：{1}<br/>公司信息：{2}";
        
        public ActionResult Index()
        {
            ViewBag.Message = "欢迎来到红秀不在家";

            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "关于我们";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "联系QQ：635794105";

            return View();
        }

        #region ActionResult：获取全部家装公司、设计师、商家

        public ActionResult GetAllUsersExceptNormal()
        {
            try
            {
                List<MapPoint> mpList = new List<MapPoint>();
                string searchText = Request.Params.Get("SearchText");
                GetAllDesignCompany(mpList,searchText);
                GetAllDesigner(mpList, searchText);
                GetAllSeller(mpList, searchText);
                return Json(mpList);
            }
            catch
            {
                return null;
            }
        }

        public ActionResult GetAllDesigner()
        {
            try
            {
                List<MapPoint> mpList = new List<MapPoint>();
                string searchText = Request.Params.Get("SearchText");
                GetAllDesigner(mpList, searchText);
                return Json(mpList);
            }
            catch (Exception)
            {
                return null;
            }
        }

        public ActionResult GetAllDesignCompany()
        {
            try
            {
                List<MapPoint> mpList = new List<MapPoint>();
                string searchText = Request.Params.Get("SearchText");
                GetAllDesignCompany(mpList, searchText);
                return Json(mpList);
            }
            catch
            {
                return null;
            }
        }

        public ActionResult GetAllSeller()
        {
            try
            {
                List<MapPoint> mpList = new List<MapPoint>();
                string searchText = Request.Params.Get("SearchText");
                GetAllSeller(mpList, searchText);
                return Json(mpList);
            }
            catch (Exception)
            {
                return null;
            }
        }

        #endregion

        #region 私有方法：获取全部家装公司、设计师、商家

        private void GetAllDesigner(List<MapPoint> mpList, string searchText)
        {
            var queryObjects = from du in rshEntities.Designer_User
                               from rshu in rshEntities.RSH_User
                               where du.UserID==rshu.UserID && rshu.UserName.Contains(searchText)
                               select du;
            foreach (var queryObject in queryObjects)
            {
                var users = (from user in rshEntities.RSH_User
                            where user.UserID == queryObject.UserID
                            select user).FirstOrDefault();
                var address = (from addr in rshEntities.AddressPoint
                               where addr.Address == queryObject.Address
                               select addr).FirstOrDefault();
                MapPoint mp = new MapPoint();
                string workingAge = (DateTime.Now.Year - queryObject.StartWorkTime.Year + 1).ToString();
                mp.Id = Guid.NewGuid().ToString();
                mp.Description = string.Format(DesignerDescriptionFormat, queryObject.Sex, queryObject.Phone,
                    queryObject.Address, workingAge, queryObject.DesignConcept);
                mp.Address = queryObject.Address;
                mp.Title = users.UserName;
                mp.Type = users.UserType;
                mp.Longitude = address == null ? "0" : address.Longitute;
                mp.Latitude = address == null ? "0" : address.Latitude;
                mpList.Add(mp);
            }
        }

        private void GetAllDesignCompany(List<MapPoint> mpList, string searchText)
        {
            var queryObjects = from dcu in rshEntities.DesignCompany_User
                               from rshu in rshEntities.RSH_User
                               where dcu.UserID == rshu.UserID && rshu.UserName.Contains(searchText)
                               select dcu;
            foreach (var queryObject in queryObjects)
            {
                var users = (from user in rshEntities.RSH_User
                            where user.UserID == queryObject.UserID
                            select user).FirstOrDefault();
                var address = (from addr in rshEntities.AddressPoint
                    where addr.Address == queryObject.Address
                    select addr).FirstOrDefault();
                MapPoint mp = new MapPoint();
                mp.Description = string.Format(DesignCompanyDescriptionFormat, queryObject.Phone, queryObject.Address, queryObject.Description);
                mp.Id = Guid.NewGuid().ToString();
                mp.Address = queryObject.Address;
                mp.Title = users.UserName;
                mp.Type = users.UserType;
                mp.Longitude = address == null ? "0" : address.Longitute;
                mp.Latitude = address == null ? "0" : address.Latitude;
                mpList.Add(mp);
            }
        }

        private void GetAllSeller(List<MapPoint> mpList, string searchText)
        {
            var queryObjects = from su in rshEntities.Seller_User
                               from rshu in rshEntities.RSH_User
                               where su.UserID == rshu.UserID && rshu.UserName.Contains(searchText)
                               select su;
            foreach (var queryObject in queryObjects)
            {
                var users = (from user in rshEntities.RSH_User
                            where user.UserID == queryObject.UserID
                            select user).FirstOrDefault();
                var address = (from addr in rshEntities.AddressPoint
                               where addr.Address == queryObject.Address
                               select addr).FirstOrDefault();
                MapPoint mp = new MapPoint();
                mp.Description = string.Format(SellerDescriptionFormat, queryObject.Phone, queryObject.Address, queryObject.Description);
                mp.Id = Guid.NewGuid().ToString();
                mp.Address = queryObject.Address;
                mp.Title = users.UserName;
                mp.Type = users.UserType;
                mp.Longitude = address == null ? "0" : address.Longitute;
                mp.Latitude = address == null ? "0" : address.Latitude;
                mpList.Add(mp);
            }
        }

        #endregion


    }
}
