using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
public class CubicBezierDemo : MonoBehaviour
{
    public Transform AnchorStart;
    public Transform AnchorEnd;
    public Transform ControlStart;
    public Transform ControlEnd;

    [Range(2,100)]
    public int CurveResolution = 10;

    private bool IsPlaying = false;
    public AnimationCurve temporalEasing;
    //in time
    public float TweenTimeLength = 3;
    //

    private float TweenTimeCurrent = 0;

    void Start()
    {
        
    }

    
    void Update()
    {
        if (IsPlaying) TweenTimeCurrent += Time.deltaTime;

        float p = Mathf.Clamp(TweenTimeCurrent / TweenTimeLength, 0, 1);

        p = temporalEasing.Evaluate(p);
        Vector3 pos = FindPointOnCurve(p);
        transform.position = pos;

        Vector3 pos2 = FindPointOnCurve(p + .05f);


        Vector3 curveForward = (pos2 - pos).normalized;



        Quaternion rot = Quaternion.LookRotation(curveForward);

        transform.rotation = rot;

        if (TweenTimeCurrent >= TweenTimeLength) IsPlaying = false;



    }

    public void PlayTween(bool fromBeginning = true)
    {
        IsPlaying = true;
        if(fromBeginning) TweenTimeCurrent = 0;
    }

    private void OnDrawGizmos()
    {
        for (int i = 0; i < CurveResolution; i++)
        {
            Vector3 a = FindPointOnCurve(i / (float)CurveResolution);
            Vector3 b = FindPointOnCurve((i + 1) / (float)CurveResolution);
            Gizmos.DrawLine(a, b);
              
        }
        
    }

    Vector3 FindPointOnCurve(float percent)
    {
        // A = pt between start control, end control
        Vector3 a = AnimMath.Lerp(ControlStart.position, ControlEnd.position, percent);

        //find pt between aka B = start anchor, start control
        Vector3 b = AnimMath.Lerp(AnchorStart.position, ControlStart.position, percent);

        //find pt between aka C = end control, end anchor
        Vector3 c = AnimMath.Lerp(ControlEnd.position, AnchorEnd.position, percent);
        //D = pt between B, A
        Vector3 d = AnimMath.Lerp(b, a, percent);
        //E = pt between A, C
        Vector3 e = AnimMath.Lerp(a,c , percent);
        //F = pt between D, E
        return AnimMath.Lerp(d, e, percent);


    }
}

[CustomEditor(typeof(CubicBezierDemo))]
public class CubicEditor : Editor
{
    public override void OnInspectorGUI()
    {
        base.OnInspectorGUI();

        if (GUILayout.Button("Play Tween"))
        {
            (target as CubicBezierDemo).PlayTween();
        }
    }
}