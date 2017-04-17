using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;

namespace RedShowHome.Models.Context
{
    public static class ContextHelper
    {
        private static Context _currentContext = new Context();

        public static IContext GetCurrent()
        {
            return _currentContext;
        }

        /// <summary>
        /// 创建上下文对象
        /// </summary>

        public static void DestroyContext()
        {
            _currentContext = null;
        }

        public static string WelcomeUserName()
        {
            if (GetCurrent() != null)
            {
                if (GetCurrent().GetItem("UserName") != "")
                {
                    return "欢迎 - " + GetCurrent().GetItem("UserName");
                }
            }
            return "请先登录";
        }
    }
}