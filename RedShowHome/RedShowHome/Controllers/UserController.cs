using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.Ajax.Utilities;
using RedShowHome.Models;
using Context = System.Runtime.Remoting.Contexts.Context;

namespace RedShowHome.Controllers
{
    public class UserController : BaseController
    {

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
            return RedirectToAction("Register");
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
                ru.LoginPassword = Request.Params.Get("LoginPassword");
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
