using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LerpDemo : MonoBehaviour
{

    public Transform pointA;
    public Transform pointB;
    
    [Range(0,1)]
    public float percent = 0;

    void DoInterpolation()
    {
        if(pointA == null) return;
        if(pointB == null) return;

        Vector3 pos = AnimMath.Lerp(pointA.position, pointB.position, percent, false);

        Quaternion rot = Quaternion.Lerp(pointA.rotation, pointB.rotation, percent);
        //todo: set this object's position to the lerp result
        transform.position = pos;
        transform.rotation = rot;
    }

    public void OnValidate()
    {
        DoInterpolation();
        
    }
}
