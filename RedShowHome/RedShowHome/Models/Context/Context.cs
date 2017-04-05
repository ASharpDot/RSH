using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RedShowHome.Models.Context
{
    public class Context:IContext
    {
        public Dictionary<string,object> ContextMap=new Dictionary<string, object>();

        public Context()
        {
        }

        public Dictionary<string, object> GetContextMap()
        {
            return ContextMap;
        }

        public object GetItem(string key)
        {
            return ContextMap.ContainsKey(key) ? ContextMap[key] : null;
        }

        public void SetItem(string key, object value)
        {
            GetContextMap().Add(key, value);
        }
    }
}