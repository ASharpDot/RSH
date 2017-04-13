using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RedShowHome.Models.Context
{
    public class Context:IContext
    {
        public Dictionary<string,string> ContextMap=new Dictionary<string, string>();

        public Context()
        {
        }

        public Dictionary<string, string> GetContextMap()
        {
            return ContextMap;
        }

        public object GetItem(string key)
        {
            return ContextMap.ContainsKey(key) ? ContextMap[key] : "";
        }

        public void SetItem(string key, string value)
        {
            if (ContextMap.ContainsKey(key)){
                ContextMap[key] = value;
                return;
            }
            GetContextMap().Add(key, value);
        }
    }
}