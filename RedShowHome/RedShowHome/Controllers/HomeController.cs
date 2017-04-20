using System;
using System.Collections.Generic;
using System.Data.Objects.SqlClient;
using System.Drawing;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Security;
using System.Web;
using System.Web.Mvc;
using Microsoft.Ajax.Utilities;
using RedShowHome.Models;
using WebGrease.Css.Ast.Selectors;

namespace RedShowHome.Controllers
{
    public class HomeController : BaseController
    {
        private const string DesignCompanyDescriptionFormat = "联系方式：{0}<br/>联系地址：{1}<br/>公司信息：{2}<br/>粉丝数量：{3}";
        private const string DesignerDescriptionFormat = "性别：{0}<br/>联系方式：{1}<br/>联系地址：{2}<br/>工作经验：{3}年<br/>设计理念：{4}<br/>粉丝数量：{5}";
        private const string SellerDescriptionFormat = "联系方式：{0}<br/>联系地址：{1}<br/>公司信息：{2}<br/>粉丝数量：{3}";

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
                string searchText = Request.Params.Get(Constant.SearchText) ?? "";
                string city = Request.Params.Get(Constant.City) ?? "";
                GetAllDesignCompany(mpList, searchText, city);
                GetAllDesigner(mpList, searchText, city);
                GetAllSeller(mpList, searchText, city);
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
                string searchText = Request.Params.Get(Constant.SearchText) ?? "";
                string city = Request.Params.Get(Constant.City) ?? "";
                GetAllDesigner(mpList, searchText, city);
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
                string searchText = Request.Params.Get(Constant.SearchText) ?? "";
                string city = Request.Params.Get(Constant.City) ?? "";
                GetAllDesignCompany(mpList, searchText, city);
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
                string searchText = Request.Params.Get(Constant.SearchText) ?? "";
                string city = Request.Params.Get(Constant.City) ?? "";
                GetAllSeller(mpList, searchText, city);
                return Json(mpList);
            }
            catch (Exception)
            {
                return null;
            }
        }

        #endregion

        #region ActionResult:按距离查找

        public ActionResult GetDesignerByDistance()
        {
            try
            {
                List<MapPoint> mpList = new List<MapPoint>();
                string searchText = Request.Params.Get(Constant.SearchText) ?? "";
                decimal longitude = Convert.ToDecimal(Request.Params.Get(Constant.Longitude));
                decimal latitude = Convert.ToDecimal(Request.Params.Get(Constant.Latitude));
                string city = Request.Params.Get(Constant.City) ?? "";
                GetDesignerByDistance(mpList, searchText, longitude, latitude, city);
                return Json(mpList);
            }
            catch (Exception)
            {
                return null;
            }
        }

        public ActionResult GetDesignCompanyByDistance()
        {
            try
            {
                List<MapPoint> mpList = new List<MapPoint>();
                string searchText = Request.Params.Get(Constant.SearchText) ?? "";
                decimal longitude = Convert.ToDecimal(Request.Params.Get(Constant.Longitude));
                decimal latitude = Convert.ToDecimal(Request.Params.Get(Constant.Latitude));
                string city = Request.Params.Get(Constant.City) ?? "";
                GetDesignCompanyByDistance(mpList, searchText, longitude, latitude, city);
                return Json(mpList);
            }
            catch (Exception)
            {
                return null;
            }
        }

        public ActionResult GetSellerByDistance()
        {
            try
            {
                List<MapPoint> mpList = new List<MapPoint>();
                string searchText = Request.Params.Get(Constant.SearchText) ?? "";
                decimal longitude = Convert.ToDecimal(Request.Params.Get(Constant.Longitude));
                decimal latitude = Convert.ToDecimal(Request.Params.Get(Constant.Latitude));
                string city = Request.Params.Get(Constant.City) ?? "";
                GetSellerByDistance(mpList, searchText, longitude, latitude, city);
                return Json(mpList);
            }
            catch (Exception)
            {
                return null;
            }
        }

        #endregion

        #region ActionResult：按粉丝数量查找

        public ActionResult GetDesignerByFansQuantity()
        {
            try
            {
                List<MapPoint> mpList = new List<MapPoint>();
                string searchText = Request.Params.Get(Constant.SearchText) ?? "";
                string city = Request.Params.Get(Constant.City) ?? "";
                GetDesignerByFansQuantity(mpList, searchText, city);
                return Json(mpList);
            }
            catch (Exception)
            {
                return null;
            }
        }

        public ActionResult GetDesignCompanyByFansQuantity()
        {
            try
            {
                List<MapPoint> mpList = new List<MapPoint>();
                string searchText = Request.Params.Get(Constant.SearchText) ?? "";
                string city = Request.Params.Get(Constant.City) ?? "";
                GetDesignCompanyByFansQuantity(mpList, searchText, city);
                return Json(mpList);
            }
            catch (Exception)
            {
                return null;
            }
        }

        public ActionResult GetSellerByFansQuantity()
        {
            try
            {
                List<MapPoint> mpList = new List<MapPoint>();
                string searchText = Request.Params.Get(Constant.SearchText) ?? "";
                string city = Request.Params.Get(Constant.City) ?? "";
                GetSellerByFansQuantity(mpList, searchText, city);
                return Json(mpList);
            }
            catch (Exception)
            {
                return null;
            }
        }
        #endregion

        #region 私有方法：获取全部家装公司、设计师、商家

        private void GetAllDesigner(List<MapPoint> mpList, string searchText, string city)
        {
            IEnumerable<Designer_User> queryObjects = from du in rshEntities.Designer_User
                                                     from rshu in rshEntities.RSH_User
                                                     where du.UserID == rshu.UserID && rshu.UserName.Contains(searchText)
                                                     select du;
            if (city != "未知" || city != "")
                queryObjects = from q in queryObjects
                               from ap in rshEntities.AddressPoint
                               where q.Address == ap.Address && ap.City == city
                               select q;
            SetDesignerMapPointList(mpList, queryObjects);
        }

        private void GetAllDesignCompany(List<MapPoint> mpList, string searchText, string city)
        {
            IEnumerable<DesignCompany_User> queryObjects = from dcu in rshEntities.DesignCompany_User
                                                          from rshu in rshEntities.RSH_User
                                                          where dcu.UserID == rshu.UserID && rshu.UserName.Contains(searchText)
                                                          select dcu;
            if (city != "未知" || city != "")
                queryObjects = from q in queryObjects
                               from ap in rshEntities.AddressPoint
                               where q.Address == ap.Address && ap.City == city
                               select q;
            SetDesignCompanyMapPointList(mpList, queryObjects);
        }

        private void GetAllSeller(List<MapPoint> mpList, string searchText, string city)
        {
            IEnumerable<Seller_User> queryObjects = from su in rshEntities.Seller_User
                                                   from rshu in rshEntities.RSH_User
                                                   where su.UserID == rshu.UserID && rshu.UserName.Contains(searchText)
                                                   select su;
            if (city != "未知" || city != "")
                queryObjects = from q in queryObjects
                               from ap in rshEntities.AddressPoint
                               where q.Address == ap.Address && ap.City == city
                               select q;
            SetSellerMapPointList(mpList, queryObjects);
        }

        #endregion

        #region 私有方法：按距离查找

        private void GetDesignerByDistance(List<MapPoint> mpList, string searchText, decimal longitude,
            decimal latitude, string city)
        {
            IEnumerable<Designer_User> queryObjects = from du in rshEntities.Designer_User
                                                     from rshu in rshEntities.RSH_User
                                                     from ap in rshEntities.AddressPoint
                                                     where du.UserID == rshu.UserID && rshu.UserName.Contains(searchText)
                                                     && du.Address == ap.Address
                                                     orderby SqlFunctions.Square(ap.Longitute - longitude) + SqlFunctions.Square(ap.Latitude - latitude)
                                                     select du;
            if (city != "未知" || city != "")
                queryObjects = from q in queryObjects
                               from ap in rshEntities.AddressPoint
                               where q.Address == ap.Address && ap.City == city
                               select q;
            SetDesignerMapPointList(mpList, queryObjects);
        }

        private void GetDesignCompanyByDistance(List<MapPoint> mpList, string searchText, decimal longitude,
            decimal latitude, string city)
        {
            IEnumerable<DesignCompany_User> queryObjects = from dcu in rshEntities.DesignCompany_User
                                                          from rshu in rshEntities.RSH_User
                                                          from ap in rshEntities.AddressPoint
                                                          where dcu.UserID == rshu.UserID && rshu.UserName.Contains(searchText) && dcu.Address == ap.Address
                                                          orderby SqlFunctions.Square(ap.Longitute - longitude) + SqlFunctions.Square(ap.Latitude - latitude)
                                                          select dcu;
            if (city != "未知" || city != "")
                queryObjects = from q in queryObjects
                               from ap in rshEntities.AddressPoint
                               where q.Address == ap.Address && ap.City == city
                               select q;
            SetDesignCompanyMapPointList(mpList, queryObjects);
        }

        private void GetSellerByDistance(List<MapPoint> mpList, string searchText, decimal longitude,
    decimal latitude, string city)
        {
            IEnumerable<Seller_User> queryObjects = from su in rshEntities.Seller_User
                                                   from rshu in rshEntities.RSH_User
                                                   from ap in rshEntities.AddressPoint
                                                   where su.UserID == rshu.UserID && rshu.UserName.Contains(searchText)&&su.Address==ap.Address
                                                   orderby SqlFunctions.Square(ap.Longitute - longitude) + SqlFunctions.Square(ap.Latitude - latitude)
                                                   select su;
            if (city != "未知" || city != "")
                queryObjects = from q in queryObjects
                               from ap in rshEntities.AddressPoint
                               where q.Address == ap.Address && ap.City == city
                               select q;
            SetSellerMapPointList(mpList, queryObjects);
        }
        #endregion

        #region 私有方法：按粉丝数量查找

        private void GetDesignerByFansQuantity(List<MapPoint> mpList, string searchText, string city)
        {
            IEnumerable<Designer_User> queryObjects = from du in rshEntities.Designer_User
                                                     from rshu in rshEntities.RSH_User
                                                     where du.UserID == rshu.UserID && rshu.UserName.Contains(searchText)
                                                     orderby du.FansQuantity descending
                                                     select du;
            if (city != "未知" || city != "")
                queryObjects = from q in queryObjects
                               from ap in rshEntities.AddressPoint
                               where q.Address == ap.Address && ap.City == city
                               select q;
            SetDesignerMapPointList(mpList, queryObjects);
        }

        private void GetDesignCompanyByFansQuantity(List<MapPoint> mpList, string searchText, string city)
        {
            IEnumerable<DesignCompany_User> queryObjects = from du in rshEntities.DesignCompany_User
                                                          from rshu in rshEntities.RSH_User
                                                          where du.UserID == rshu.UserID && rshu.UserName.Contains(searchText)
                                                          orderby du.FansQuantity descending
                                                          select du;
            if (city != "未知" || city != "")
                queryObjects = from q in queryObjects
                               from ap in rshEntities.AddressPoint
                               where q.Address == ap.Address && ap.City == city
                               select q;
            SetDesignCompanyMapPointList(mpList, queryObjects);
        }

        private void GetSellerByFansQuantity(List<MapPoint> mpList, string searchText, string city)
        {
            IEnumerable<Seller_User> queryObjects = from du in rshEntities.Seller_User
                                                   from rshu in rshEntities.RSH_User
                                                   where du.UserID == rshu.UserID && rshu.UserName.Contains(searchText)
                                                   orderby du.FansQuantity descending
                                                   select du;
            if (city != "未知" || city != "")
                queryObjects = from q in queryObjects
                               from ap in rshEntities.AddressPoint
                               where q.Address == ap.Address && ap.City == city
                               select q;
            SetSellerMapPointList(mpList, queryObjects);
        }

        #endregion

        #region 私有方法，设置MapPoint List

        private void SetDesignerMapPointList(List<MapPoint> mpList, IEnumerable<Designer_User> queryObjects)
        {
            foreach (var queryObject in queryObjects)
            {
                var users = (from user in rshEntities.RSH_User
                             where user.UserID == queryObject.UserID
                             select user).FirstOrDefault();
                var address = (from addr in rshEntities.AddressPoint
                               where addr.Address == queryObject.Address
                               select addr).FirstOrDefault();
                if (users != null)
                {
                    MapPoint mp = new MapPoint();
                    string workingAge = (DateTime.Now.Year - queryObject.StartWorkTime.Year + 1).ToString();
                    mp.Id = Guid.NewGuid().ToString();
                    mp.Description = string.Format(DesignerDescriptionFormat, queryObject.Sex, queryObject.Phone,
                        queryObject.Address, workingAge, queryObject.DesignConcept, queryObject.FansQuantity);
                    mp.Address = queryObject.Address;
                    mp.Title = users.UserName;
                    mp.Type = users.UserType;
                    mp.Longitude = address == null ? 0 : address.Longitute;
                    mp.Latitude = address == null ? 0 : address.Latitude;
                    mpList.Add(mp);
                }
            }
        }

        private void SetDesignCompanyMapPointList(List<MapPoint> mpList, IEnumerable<DesignCompany_User> queryObjects)
        {
            foreach (var queryObject in queryObjects)
            {
                var users = (from user in rshEntities.RSH_User
                             where user.UserID == queryObject.UserID
                             select user).FirstOrDefault();
                var address = (from addr in rshEntities.AddressPoint
                               where addr.Address == queryObject.Address
                               select addr).FirstOrDefault();
                if (users != null)
                {
                    MapPoint mp = new MapPoint();
                    mp.Description = string.Format(DesignCompanyDescriptionFormat, queryObject.Phone,
                        queryObject.Address, queryObject.Description, queryObject.FansQuantity);
                    mp.Id = Guid.NewGuid().ToString();
                    mp.Address = queryObject.Address;
                    mp.Title = users.UserName;
                    mp.Type = users.UserType;
                    mp.Longitude = address == null ? 0 : address.Longitute;
                    mp.Latitude = address == null ? 0 : address.Latitude;
                    mpList.Add(mp);
                }
            }
        }

        private void SetSellerMapPointList(List<MapPoint> mpList, IEnumerable<Seller_User> queryObjects)
        {
            foreach (var queryObject in queryObjects)
            {
                var users = (from user in rshEntities.RSH_User
                             where user.UserID == queryObject.UserID
                             select user).FirstOrDefault();
                var address = (from addr in rshEntities.AddressPoint
                               where addr.Address == queryObject.Address
                               select addr).FirstOrDefault();
                if (users != null)
                {
                    MapPoint mp = new MapPoint();
                    mp.Description = string.Format(SellerDescriptionFormat, queryObject.Phone, queryObject.Address,
                        queryObject.Description, queryObject.FansQuantity);
                    mp.Id = Guid.NewGuid().ToString();
                    mp.Address = queryObject.Address;
                    mp.Title = users.UserName;
                    mp.Type = users.UserType;
                    mp.Longitude = address == null ? 0 : address.Longitute;
                    mp.Latitude = address == null ? 0 : address.Latitude;
                    mpList.Add(mp);
                }
            }
        }

        #endregion
    }
}
