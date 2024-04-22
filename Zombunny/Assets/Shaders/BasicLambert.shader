Shader "Holistic/BasicLambert"
{
    Properties {
        _Color ("Diffuse Color", Color) = (1, 1, 1, 1)
        _SpecColor ("Specular Color", Color)  = (1, 1, 1, 1)
        _Spec ("Specular", Range(0, 1)) = 0.5
        _Gloss ("Gloss", Range(0, 1)) = 0.5
    }

    SubShader {
        Tags {
            "Queue" = "Geometry"
        }

        CGPROGRAM
        #pragma surface surf Lambert

        float4 _Color;
        // _SpecColor is already predefined in Unity
        // float4 _SpecColor;
        half _Spec;
        fixed _Gloss;
        
        struct Input {
            float2 uv_mainTex;
        };

        void surf(Input IN, inout SurfaceOutput o) {
            o.Albedo = _Color.rgb;
            o.Specular = _Spec;
            o.Gloss = _Gloss;
        }

        ENDCG
    }
    
    FallBack "Diffuse"
}
