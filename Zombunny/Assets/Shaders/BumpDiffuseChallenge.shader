Shader "Holistic/BumpDiffuseChallenge"
{
    Properties {
        _myDiffuse ("Diffuse Texture", 2D) = "white" {}
        _myBump ("Bump Texture", 2D) = "bump" {}
        _bumpAmount ("Bump Amount", Range(0,10)) = 1
        _bumpScale ("Texture Bump Scale", Range(0.5,2)) = 1
    }

    SubShader {
        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D _myDiffuse;
        sampler2D _myBump;
        half _bumpAmount;
        half _bumpScale;

        struct Input {
            float2 uv_myDiffuse;
            float2 uv_myBump;  
        };

        void surf(Input IN, inout SurfaceOutput o) {
            o.Albedo = tex2D(_myDiffuse, IN.uv_myDiffuse);
            o.Normal = UnpackNormal(tex2D(_myBump, IN.uv_myBump * _bumpScale)) * float3(_bumpAmount, _bumpAmount, 1);
        }

        ENDCG
    }

   Fallback "Diffuse"
}
