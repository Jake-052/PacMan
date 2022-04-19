using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft;
using UnityEngine;

class MapModel : ModelBase
{

    //public int t;
    public MapModel()
    {
        Debug.Log("---content---");
       
        string content = File.ReadAllText("F:/052/PacMan/PacMan/Assets/Map/MapData.json");
        var mapDataArray = Newtonsoft.Json.JsonConvert.DeserializeObject<int[][]>(content);
        //mapDataArray = JsonMapper.ToObject<int[][]>(content);
    }


    public int[][] mapDataArray;
    //{
    //    get {
    //        return JsonMapper.ToObject<int[,]>(mapJson);
    //    }    
    //}
}

