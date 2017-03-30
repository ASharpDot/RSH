using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using RedShowHome.Models;

namespace RedShowHome.Controllers
{
    public class HomeController : BaseController
    {
        private const string DesignCompanyDescriptionFormat = "联系方式：{0}\n联系地址：{1}\n公司信息：{2}";
        private const string DesignerDescriptionFormat = "性别：{0}\n联系方式：{1}\n联系地址：{2}\n工作经验：{3}\n设计理念：{4}";
        private const string SellerDescriptionFormat = "联系方式：{0}\n联系地址：{1}\n公司信息：{2}";
        
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
            List<MapPoint> mpList = new List<MapPoint>();
            GetAllDesignCompany(mpList);
            GetAllDesigner(mpList);
            GetAllSeller(mpList);
            return Json(mpList);
        }

        public ActionResult GetAllDesigner()
        {
            List<MapPoint> mpList = new List<MapPoint>();
            GetAllDesigner(mpList);
            return Json(mpList);
        }

        public ActionResult GetAllDesignCompany()
        {
            List<MapPoint> mpList=new List<MapPoint>();
            GetAllDesignCompany(mpList);
            return Json(mpList);
        }

        public ActionResult GetAllSeller()
        {
            List<MapPoint> mpList = new List<MapPoint>();
            GetAllSeller(mpList);
            return Json(mpList);
        }

        #endregion

        #region 私有方法：获取全部家装公司、设计师、商家

        private void GetAllDesigner(List<MapPoint> mpList)
        {
            var queryObjects = from du in rshEntities.Designer_User
                               select du;
            foreach (var queryObject in queryObjects)
            {
                var name = (from user in rshEntities.RSH_User
                            where user.UserID == queryObject.UserID
                            select user.UserName).FirstOrDefault();
                MapPoint mp = new MapPoint();
                string workingAge = (DateTime.Now.Year - queryObject.StartWorkTime.Year).ToString();
                mp.Description = string.Format(DesignerDescriptionFormat, queryObject.Sex, queryObject.Phone,
                    queryObject.Address, workingAge, queryObject.DesignConcept);
                mp.Address = queryObject.Address;
                mp.Title = name;
                mpList.Add(mp);
            }
        }

        private void GetAllDesignCompany(List<MapPoint> mpList)
        {
            var queryObjects = from dcu in rshEntities.DesignCompany_User
                               select dcu;
            foreach (var queryObject in queryObjects)
            {
                var name = (from user in rshEntities.RSH_User
                            where user.UserID == queryObject.UserID
                            select user.UserName).FirstOrDefault();
                MapPoint mp = new MapPoint();
                mp.Description = string.Format(DesignCompanyDescriptionFormat, queryObject.Phone, queryObject.Address, queryObject.Description);
                mp.Address = queryObject.Address;
                mp.Title = name;
                mpList.Add(mp);
            }
        }

        private void GetAllSeller(List<MapPoint> mpList)
        {
            var queryObjects = from su in rshEntities.Seller_User
                               select su;
            foreach (var queryObject in queryObjects)
            {
                var name = (from user in rshEntities.RSH_User
                            where user.UserID == queryObject.UserID
                            select user.UserName).FirstOrDefault();
                MapPoint mp = new MapPoint();
                mp.Description = string.Format(SellerDescriptionFormat, queryObject.Phone, queryObject.Address, queryObject.Description);
                mp.Address = queryObject.Address;
                mp.Title = name;
                mpList.Add(mp);
            }
        }

        #endregion
    }
}
