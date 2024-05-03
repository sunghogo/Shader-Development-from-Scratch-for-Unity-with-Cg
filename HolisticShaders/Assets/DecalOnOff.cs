using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class DecalOnOff : MonoBehaviour
{
    public Material mat;
    bool showDecal = true;

    // Will need collider to detect mouse clicks
    void OnMouseDown() {
        showDecal = !showDecal;
        if (showDecal) mat.SetFloat("_ShowDecal", 1);
        else mat.SetFloat("_ShowDecal", 0);
    }
    
    // Start is called before the first frame update
    void Start()
    {
        mat = GetComponent<Renderer>().sharedMaterial;    
    }
}
