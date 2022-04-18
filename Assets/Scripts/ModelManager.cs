using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


class ModelManager
{
    public static T GetModel<T>() where T : ModelBase
    {
        Type type = typeof(T);
        return (T)InstanceManager.getInstance(type);
    }
}

