Shader "Holistic/StandardPBR" {
    Properties {
        _color("Color", Color) = (1, 1, 1, 1)
        _metallicTex("Metallic (R)", 2D) = "white" {}
        _metallic("Metallic", Range(0.0, 1.0)) = 0.0
    }
    
    SubShader {
        Tags {
            "Queue" = "Geometry"
        }
        
        CGPROGRAM
        #pragma surface surf Standard

        fixed4 _color;
        sampler2D _metallicTex;
        half _metallic;

        struct Input {
            float2 uv_metallicTex;
        };

        void surf(Input IN, inout SurfaceOutputStandard o) {
            o.Albedo = _color.rgb;
            o.Smoothness = tex2D(_metallicTex, IN.uv_metallicTex).r;
            o.Metallic = _metallic;
        }
        ENDCG
    }

    Fallback "Diffuse"
}