Shader "Holistic/Rim" {
    Properties {
        _rimColor ("Rim Color", Color) = (0, 0.5, 0.5, 0)
        _rimPower ("Rim Power", Range(0.5, 8.0)) = 3.0
    }

    SubShader {
        CGPROGRAM
            #pragma surface surf Lambert

            struct Input {
                float3 viewDir;
            };

            float4 _rimColor;
            float _rimPower;

            void surf (Input IN, inout SurfaceOutput o) {
                // In.viewDir is usually normalized but use normalize() to be sure, also use saturate() to clamp values to [0,1]
                half rim = 1 - saturate(dot(normalize(IN.viewDir), o.Normal)); 
                // Make rim exponential using pow function for harsher falloff of light
                o.Emission = _rimColor.rgb * pow(rim, _rimPower);
            }
        ENDCG
    }

    Fallback "Diffuse"
}