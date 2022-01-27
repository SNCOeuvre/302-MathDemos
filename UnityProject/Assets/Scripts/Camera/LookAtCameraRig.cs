using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LookAtCameraRig : MonoBehaviour
{
    public Transform target;
    public float desiredDistance = 10;

    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (target == null) return;
        Vector3 vToTarget = target.position - transform.position;


        //position~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        Vector3 targetPosition = -vToTarget;
        targetPosition.Normalize();
        targetPosition *= desiredDistance;

        targetPosition += target.position;

        transform.position = AnimMath.Ease(transform.position, targetPosition, .01f);

        //turning to look at target~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

        transform.rotation = Quaternion.LookRotation(vToTarget,Vector3.up);

        //combine orbit and lookat camera
    }
}
