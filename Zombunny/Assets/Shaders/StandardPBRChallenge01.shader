Shader "Holistic/StandardPBRChallenge01" {
    Properties {
        _Color ("Color", Color) = (1, 1, 1, 1)
        _MetallicTex ("Mettalic Texture (R)", 2D) = "white" {}
        _Metallic ("Metallic", Range(0, 1)) = 0
        _Emission ("Emission", Range(0, 10)) = 1
    }

    SubShader {
        Tags {
            "Queue" = "Geometry"
        }

        CGPROGRAM
        #pragma surface surf Standard

        fixed4 _Color;
        sampler2D _MetallicTex;
        half _Metallic;
        half _Emission;

        struct Input {
            float2 uv_MetallicTex;
        };

        void surf(Input IN, inout SurfaceOutputStandard o) {
            o.Albedo = _Color.rgb;
            o.Smoothness = tex2D(_MetallicTex, IN.uv_MetallicTex).r;
            o.Metallic = _Metallic;
            o.Emission = tex2D(_MetallicTex, IN.uv_MetallicTex).r * _Emission;
        }
        ENDCG
    }

    Fallback "Diffuse"
}