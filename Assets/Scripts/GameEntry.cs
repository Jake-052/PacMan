using UnityEngine;
using LitJson;

class GameEntry : MonoBehaviour
{
    MapModel mapModel = ModelManager.GetModel<MapModel>();

    public void Start()
    {
        if (mapModel == null)
        {
            Debug.Log("框架问题");
        }
        else
        {
            Debug.Log("框架没问题");
        }

        for (int i = 0; i < mapModel.mapDataArray.GetLength(0); i++)
        {
            for (int j = 0; j < mapModel.mapDataArray.GetLength(1); j++)
            {
                Debug.Log("-----"+mapModel.mapDataArray[i][j]);
            }
        }
       
    }
}

