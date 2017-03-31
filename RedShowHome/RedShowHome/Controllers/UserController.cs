using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.Ajax.Utilities;
using Microsoft.Web.Infrastructure;
using RedShowHome.Models;
using WebGrease.Css.Ast.Selectors;
using Context = System.Runtime.Remoting.Contexts.Context;
using System.Web.Security;

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
                var loginEmail = HttpContext.Request.Params.Get("LoginEmail");
                var loginPassword = Encrypt(Request.Params.Get("LoginPassword"));
                var query = (from user in rshEntities.RSH_User
                    where user.LoginEmail == loginEmail && user.LoginPassword == loginPassword
                    select user).FirstOrDefault();
                if (query != null)
                {
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
                nu.UserID = Session["UserID"].ToString();
                nu.Sex = Request.Params.Get("Sex");
                nu.Phone = Request.Params.Get("Phone");
                rshEntities.Normal_User.Add(nu);
                rshEntities.SaveChanges();
                return Json(new {UserID = nu.UserID});

            }
            catch (Exception ex)
            {
                return null;
            }
        }

        private void CreateAddressPoint(string address,string longitude,string latitude)
        {
            AddressPoint ap=new AddressPoint();
            ap.Address = address;
            ap.Longitute = longitude;
            ap.Latitude = latitude;
            rshEntities.AddressPoint.Add(ap);
            rshEntities.SaveChanges();
        }

        public ActionResult SetDesignerUserInfo()
        {
            try
            {
                Designer_User du = new Designer_User();
                du.UserID = Session["UserID"].ToString();
                du.Sex = Request.Params.Get("Sex");
                du.Phone = Request.Params.Get("Phone");
                du.StartWorkTime = DateTime.Parse(Request.Params.Get("StartWorkTime"));
                du.Address = Request.Params.Get("Address");
                du.DesignConcept = Request.Params.Get("DesignConcept");
                du.FansQuantity = 0;
                CreateAddressPoint(Request.Params.Get("Address"), Request.Params.Get("Longitude"), Request.Params.Get("Latitude"));
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
                dcu.UserID = Session["UserID"].ToString();
                dcu.Address = Request.Params.Get("Address");
                dcu.Phone = Request.Params.Get("Phone");
                dcu.Description = Request.Params.Get("Description");
                dcu.FansQuantity = 0;
                CreateAddressPoint(Request.Params.Get("Address"), Request.Params.Get("Longitude"), Request.Params.Get("Latitude"));
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
                su.UserID = Session["UserID"].ToString();
                su.Address = Request.Params.Get("Address");
                su.Phone = Request.Params.Get("Phone");
                su.Description = Request.Params.Get("Description");
                su.FansQuantity = 0;
                CreateAddressPoint(Request.Params.Get("Address"), Request.Params.Get("Longitude"), Request.Params.Get("Latitude"));
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
                ru.LoginEmail = Request.Params.Get("LoginEmail");
                ru.UserName = Request.Params.Get("UserName");
                ru.LoginPassword = Encrypt(Request.Params.Get("LoginPassword"));
                ru.UserID = Guid.NewGuid().ToString();
                Session["UserID"] = ru.UserID;
                ru.UserType = int.Parse(Request.Params.Get("UserType"));
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
