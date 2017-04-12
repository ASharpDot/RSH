using System;
using System.Collections.Generic;
using System.Data.Odbc;
using System.Linq;
using System.Transactions;
using System.Web;
using System.Web.Mvc;
using Microsoft.Ajax.Utilities;
using Microsoft.Web.Infrastructure;
using RedShowHome.Models;
using WebGrease.Css.Ast.Selectors;
using Context = System.Runtime.Remoting.Contexts.Context;
using System.Web.Security;
using RedShowHome.Models.Context;

namespace RedShowHome.Controllers
{
    public class UserController : BaseController
    {
        public string Encrypt(string prime)
        {
            return FormsAuthentication.HashPasswordForStoringInConfigFile(prime, "MD5");
        }

        public ActionResult Login()
        {
            return View();
        }

        public ActionResult Register()
        {
            return View();
        }

        public ActionResult Check()
        {
            try
            {
                var loginEmail = HttpContext.Request.Params.Get(Constant.LoginEmail);
                var loginPassword = Encrypt(Request.Params.Get(Constant.LoginPassword));
                var query = (from user in rshEntities.RSH_User
                    where user.LoginEmail == loginEmail && user.LoginPassword == loginPassword
                    select user).FirstOrDefault();
                if (query != null)
                {
                    ContextHelper.GetCurrent().SetItem(Constant.UserID,query.UserID);
                    ContextHelper.GetCurrent().SetItem(Constant.UserName,query.UserName);
                    return Json("/Home/Index");
                }
                else
                {
                    return null;
                }
            }
            catch(Exception ex)
            {
                return null;
            }
        }

        public ActionResult Mine()
        {
            return View();
        }

        public ActionResult NormalUserInfo()
        {
            return View();
        }

        public ActionResult DesignCompanyUserInfo()
        {
            return View();
        }

        public ActionResult DesignerUserInfo()
        {
            return View();
        }

        public ActionResult SellerUserInfo()
        {
            return View();
        }

        public ActionResult SetNormalUserInfo()
        {
            try
            {
                Normal_User nu = new Normal_User();
                nu.UserID = Session[Constant.UserID].ToString();
                nu.Sex = Request.Params.Get(Constant.Sex);
                nu.Phone = Request.Params.Get(Constant.Phone);
                rshEntities.Normal_User.Add(nu);
                rshEntities.SaveChanges();
                return Json(new {UserID = nu.UserID});

            }
            catch (Exception ex)
            {
                return null;
            }
        }

        private void CreateAddressPoint(string address, decimal longitude, decimal latitude)
        {
            var isExistAddress = from ad in rshEntities.AddressPoint
                where ad.Address == address
                select ad;
            if (isExistAddress.Count()>0)
            {
                AddressPoint ap = new AddressPoint();
                ap.Address = address;
                ap.Longitute = longitude;
                ap.Latitude = latitude;
                rshEntities.AddressPoint.Add(ap);
            }
        }

        public ActionResult SetDesignerUserInfo()
        {
            try
            {
                Designer_User du = new Designer_User();
                du.UserID = ContextHelper.GetCurrent().GetItem(Constant.UserID).ToString();
                du.Sex = Request.Params.Get(Constant.Sex);
                du.Phone = Request.Params.Get(Constant.Phone);
                du.StartWorkTime = Convert.ToDateTime(Request.Params.Get(Constant.StartWorkTime));
                du.Address = Request.Params.Get(Constant.Address);
                du.DesignConcept = Request.Params.Get(Constant.DesignConcept);
                du.FansQuantity = 0;
                CreateAddressPoint(Request.Params.Get(Constant.Address), Convert.ToDecimal(Request.Params.Get(Constant.Longitude)),
                    Convert.ToDecimal(Request.Params.Get(Constant.Latitude)));
                rshEntities.Designer_User.Add(du);
                rshEntities.SaveChanges();
                return Json(new {UserID = du.UserID});
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public ActionResult SetDesignCompanyUserInfo()
        {
            try
            {
                DesignCompany_User dcu = new DesignCompany_User();
                dcu.UserID = ContextHelper.GetCurrent().GetItem(Constant.UserID).ToString();
                dcu.Address = Request.Params.Get(Constant.Address);
                dcu.Phone = Request.Params.Get(Constant.Phone);
                dcu.Description = Request.Params.Get(Constant.Description);
                dcu.FansQuantity = 0;
                CreateAddressPoint(Request.Params.Get(Constant.Address), Convert.ToDecimal(Request.Params.Get(Constant.Longitude)),
                    Convert.ToDecimal(Request.Params.Get(Constant.Latitude)));
                rshEntities.DesignCompany_User.Add(dcu);
                rshEntities.SaveChanges();
                return Json(new {UserID = dcu.UserID});

            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public ActionResult SetSellerUserInfo()
        {
            try
            {
                Seller_User su = new Seller_User();
                su.UserID = ContextHelper.GetCurrent().GetItem(Constant.UserID).ToString();
                su.Address = Request.Params.Get(Constant.Address);
                su.Phone = Request.Params.Get(Constant.Phone);
                su.Description = Request.Params.Get(Constant.Description);
                su.FansQuantity = 0;
                CreateAddressPoint(Request.Params.Get(Constant.Address), Convert.ToDecimal(Request.Params.Get(Constant.Longitude)),
                    Convert.ToDecimal(Request.Params.Get(Constant.Latitude)));
                rshEntities.Seller_User.Add(su);
                rshEntities.SaveChanges();
                return Json(new {UserID = su.UserID});

            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public ActionResult CreateUser()
        {
            try
            {
                RSH_User ru = new RSH_User();
                ru.LoginEmail = Request.Params.Get(Constant.LoginEmail);
                ru.UserName = Request.Params.Get(Constant.UserName);
                ru.LoginPassword = Encrypt(Request.Params.Get(Constant.LoginPassword));
                ru.UserID = Guid.NewGuid().ToString();
                ContextHelper.GetCurrent().SetItem(Constant.UserID, ru.UserID);
                ContextHelper.GetCurrent().SetItem(Constant.UserName, ru.UserName);
                ru.UserType = Convert.ToInt32(Request.Params.Get(Constant.UserType));
                rshEntities.RSH_User.Add(ru);
                rshEntities.SaveChanges();
                return Json(new {UserType = ru.UserType});
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}
