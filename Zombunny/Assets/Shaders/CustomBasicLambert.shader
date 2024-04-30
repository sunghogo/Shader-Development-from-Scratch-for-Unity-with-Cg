Shader "Holistic/CustomBasicLambert" {
    Properties {
        _Color("Color", Color) = (1, 1, 1, 1)
    }

    SubShader{
        CGPROGRAM
        #pragma surface surf CustomBasicLambert

        half4 LightingCustomBasicLambert(SurfaceOutput s, half3 lightDir, half atten) {
            half NdotL = saturate(dot(normalize(s.Normal), normalize(lightDir)));
            half4 c;
            c.rgb = s.Albedo * _LightColor0.rgb * (NdotL * atten); // _LightColor0 is the color of all the lights going on in the scene
            c.a = s.Alpha; 
            return c;
        }
        
        fixed4 _Color;

        struct Input {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutput o) {
            o.Albedo = _Color.rgb;
        }
        ENDCG
    }

    Fallback "Diffuse"
}