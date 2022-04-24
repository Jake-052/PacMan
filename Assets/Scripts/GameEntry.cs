using System.IO;
using UnityEngine;

class GameEntry : MonoBehaviour
{
    MapModel mapModel = ModelManager.GetModel<MapModel>();

    public void Start()
    {

        string str = File.ReadAllText(@"F:\052\PacMan\PacMan\Assets\Map");
        Debug.Log("------"+ str);

        //for (int i = 0; i < mapModel.mapDataArray.GetLength(0); i++)
        //{
        //    for (int j = 0; j < mapModel.mapDataArray.GetLength(1); j++)
        //    {
        //        Debug.Log("-----"+mapModel.mapDataArray[i][j]);
        //    }
        //}

    }
}

