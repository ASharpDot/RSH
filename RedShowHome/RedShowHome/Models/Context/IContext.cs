using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RedShowHome.Models.Context
{
    public interface IContext
    {
        object GetItem(string key);

        void SetItem(string key, string value);
    }
}