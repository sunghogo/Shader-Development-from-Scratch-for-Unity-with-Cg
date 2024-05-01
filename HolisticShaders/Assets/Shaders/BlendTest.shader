Shader "Holistic/BlendTest" {
    Properties {
        _MainTex ("Texture", 2D) = "black" {} // black is transparent, white is opaque for transparent objects
    }

    SubShader {
        Tags { "Queue" = "Transparent" }

        Blend One One // black is transparent
        // Blend SrcAlpha OneMinusSrcAlpha // Traditional blend for transparency
        // Blend DstColor Zero // soft additive blend, white transparent

        Pass {
            SetTexture [_MainTex] { combine texture }
        }
    }
}