Shader "Holistic/Cutoff" {
    Properties {
        _rimColor ("Rim Color", Color) = (0, 0.5, 0.5, 0)
        _rimPower("Rim Power", Range(0.5, 8.0)) = 3.0
    }

    SubShader {
        CGPROGRAM
            #pragma surface surf Lambert

            struct Input {
                float3 viewDir;
                float3 worldPos;
            };

            float4 _rimColor;
            float _rimPower;

            void surf(Input IN, inout SurfaceOutput o) {
                half rim = 1 - saturate(dot(normalize(IN.viewDir), o.Normal));
                // o.Emission = _rimColor.rgb * rim > 0.8 ? rim : 0; // Set cutoff for rim lighting
                // o.Emission = rim > 0.5 ? float3(1, 0, 0) : 0; // Set rim lighting directly
                // o.Emission = rim > 0.5 ? float3(1, 0, 0) : rim > 0.3 ? float3(0, 1, 0) : 0; // Set conditional bands of rim lighting
                // o.Emission = IN.worldPos.y > 1 ? float3(0, 1, 0) : float3(1, 0, 0); // Color according to world position

                // frac gives the remainder/decimal portion of a fractional number
                // o.Emission = frac(IN.worldPos.y * 10 * 0.5) > 0.4999 ? float3(0, 1, 0) : float3(1, 0, 0);

                o.Emission = frac(IN.worldPos.y * 10 * 0.5) > 0.4999 ? float3(0, 1, 0) * rim : float3(1, 0, 0) * rim; // Adding in the rim adds depth back to the color


            }
        ENDCG
    }
    Fallback "Diffuse"
}