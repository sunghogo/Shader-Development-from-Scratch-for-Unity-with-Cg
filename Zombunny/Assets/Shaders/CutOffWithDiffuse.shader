Shader "Holistic/CutOffWithDiffuse"
{
    Properties
    {
        _diffuseMap ("Texture", 2D) = "white" {}
        _rimColor ("Rim Color", Color) = (1, 1, 1, 1)
        _rimPower ("Rim Power", Range(0.5, 8)) = 1
        _stripeWidth ("Stripe Width", Range(1, 20)) = 10
    }

    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        struct Input {
            float3 viewDir;
            float3 worldPos;
            float2 uv_diffuseMap;
        };

        sampler2D _diffuseMap;
        float4 _rimColor;
        float _rimPower;
        float _stripeWidth;

        void surf(Input IN, inout SurfaceOutput o) {
            float rim = 1 - saturate(dot(normalize(IN.viewDir), o.Normal));
            o.Albedo = tex2D(_diffuseMap, IN.uv_diffuseMap).rgb;
            o.Emission = frac(IN.worldPos.y * (20 - _stripeWidth) * 0.5) > 0.4999999 ? float3(0, 1, 0) : float3(1, 0, 0);
            o.Emission *= _rimColor.rgb * pow(rim, _rimPower);
            
        }

        ENDCG
    }
        FallBack "Diffuse"
}
