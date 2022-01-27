using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FlightCameraRig : MonoBehaviour
{
    public float speed = 10;

    private float pitch = 0;
    private float yaw = 0;

    public float mouseSensitivityX = 1;
    public float mouseSensitivityY = 1;

    private void Start()
    {
        Cursor.lockState = CursorLockMode.Locked;
    }

    // Update is called once per frame
    void Update()
    {
        //update position~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        float v = Input.GetAxis("Vertical"); //forward and back
        float h = Input.GetAxis("Horizontal"); //left and right (strafe)

        //transform.position += transform.forward * v * Time.deltaTime; //speed is distance over time; 1 meter per second(with delta time)
        Vector3 dir = transform.forward * v + transform.right * h; //v and h are changing values

        if (dir.magnitude > 1) dir.Normalize(); // *= 1/(dir.magnitude)
        transform.position += dir * Time.deltaTime * speed;

        // update rotation~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        
        //yaw = head side to side, pitch = head up and down, roll = rotate head

        float mx = Input.GetAxis("Mouse X"); //yaw (y axis)
        float my = Input.GetAxis("Mouse Y"); //pitch (x axis)

        yaw += mx * mouseSensitivityX;
        pitch += my * mouseSensitivityY;

        pitch = Mathf.Clamp(pitch, -89, 89); //clamps pitch from going above 90 and getting upside down

        transform.rotation = Quaternion.Euler(pitch, yaw, 0);
    }
}
