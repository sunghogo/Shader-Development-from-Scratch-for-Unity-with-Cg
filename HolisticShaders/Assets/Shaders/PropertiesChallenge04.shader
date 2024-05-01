Shader "Holistic/PropChallenge4"
{
    Properties {
        _myDiffuseTex ("Diffuse Texture", 2D) = "white" {}
        _myEmissionTex ("Emission Texture", 2D) = "black" {}
    }

    SubShader {
        CGPROGRAM
            #pragma surface surf Lambert

            sampler2D _myDiffuseTex;
            sampler2D _myEmissionTex;

            struct Input {
                float2 uv_myDiffuseTex;
                float2 uv2_myEmissionTex;
            };

            void surf(Input In, inout SurfaceOutput o) {
                o.Albedo = tex2D(_myDiffuseTex, In.uv_myDiffuseTex).rgb;
                o.Emission = tex2D(_myEmissionTex, In.uv2_myEmissionTex).rgb;
            }
        ENDCG
    }

    FallBack "Diffuse"
}
