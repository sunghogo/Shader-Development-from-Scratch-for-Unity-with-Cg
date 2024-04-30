Shader "Holistic/ToonRampAlbedo" {
    Properties {
        _Color ("Color" , Color) = (1, 1, 1, 1)
        _RampTex ("Ramp Texture", 2D) = "white" {}
    }

    SubShader {
        CGPROGRAM
        #pragma surface surf ToonRampAlbedo
        
        float4 _Color;
        sampler2D _RampTex;

        struct Input {
            float2 uv_MainTex;
            float viewDir;
        };

        float4 LightingToonRampAlbedo(SurfaceOutput s, fixed3 lightDir, fixed atten) {
            float diffuse = dot(normalize(lightDir), normalize(s.Normal));
            float h = diffuse * 0.5 + 0.5;
            float2 rh = h; // calculates uv
            float3 ramp = tex2D(_RampTex, rh).rgb;

            float4 c;
            c.rgb = s.Albedo * _LightColor0.rgb * ramp;
            c.a = s.Alpha;
            return c;
        }

        void surf(Input IN, inout SurfaceOutput o) {
            float NdotV = dot(o.Normal, IN.viewDir); // Denormalized to be similar to answer
            float h = NdotV * 0.5 + 0.5;
            float2 rh = h;
            float3 ramp = tex2D(_RampTex, rh).rgb;

            o.Albedo = ramp;
        }
        ENDCG
    }

    Fallback "Diffuse"
}