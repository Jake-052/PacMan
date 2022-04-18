using UnityEngine;


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
        Debug.Log(mapModel.t);
    }
}

