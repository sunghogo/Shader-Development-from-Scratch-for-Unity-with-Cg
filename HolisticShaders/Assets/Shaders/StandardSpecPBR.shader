Shader "Holistic/StandardSpecPBR" {
    Properties{
        _color ("Color", Color) = (1, 1, 1, 1)
        _metallicTex ("Metallic (R)", 2D) = "white" {}
        _SpecColor ("Specular color", Color) = (1, 1, 1, 1)
    }

    SubShader {
        Tags {
            "Queue" = "Geometry"
        }

        CGPROGRAM
        #pragma surface surf StandardSpecular
        
        fixed4 _color;
        sampler2D _metallicTex;

        struct Input {
            float2 uv_metallicTex;
        };

        void surf(Input IN, inout SurfaceOutputStandardSpecular o) {
            o.Albedo = _color.rgb;
            o.Smoothness = tex2D(_metallicTex, IN.uv_metallicTex).r;
            o.Specular = _SpecColor.rgb;
        }
        ENDCG
    }

    Fallback "Diffuse"
}