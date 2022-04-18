using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


class InstanceManager
{
    private InstanceManager()
    {
    }

    private static InstanceManager instance;
    public static InstanceManager Instance
    {
        get
        {
            if (instance == null)
            {
                instance = new InstanceManager();
            }
            return instance;
        }

    }

    private Dictionary<string, object> instanceMap = new Dictionary<string, object>();
    public T getInstance<T>()
    {
        string typeName = typeof(T).FullName;

        if (instanceMap.ContainsKey(typeName))
        {
            return (T)instanceMap[typeName];
        }
        else
        {
            T t = (T)Activator.CreateInstance(typeof(T));
            instanceMap.Add(typeName, t);
            return t;
        }

    }
}

