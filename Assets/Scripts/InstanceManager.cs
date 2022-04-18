using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


class InstanceManager
{
    public static Dictionary<Type,object> instanceMap = new Dictionary<Type, object>();
    public static object getInstance(Type type)
    {
        if (instanceMap.ContainsKey(type))
        {
            return instanceMap[type];
        }
        else
        {
            
        }
        return null;
    }
}

