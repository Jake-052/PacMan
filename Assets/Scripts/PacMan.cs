using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PacMan : MonoBehaviour
{
    private float speed;
    // Start is called before the first frame update
    void Start()
    {

    }

    private void FixedUpdate()
    {
        float horizontalInput = Input.GetAxis("Horizontal");
        float verticalInput = Input.GetAxis("Vertical");
        if (horizontalInput != 0)
        {
            transform.position += (new Vector3(horizontalInput, 0, 0)) * Time.fixedDeltaTime;
            transform.right = new Vector3(horizontalInput, 0, 0);
        }
        else if (verticalInput != 0)
        {
            transform.position += new Vector3(0, verticalInput, 0) * Time.fixedDeltaTime;
            transform.right = new Vector3(0, verticalInput, 0);
        }
    }
    // Update is called once per frame
    void Update()
    {

    }
}
