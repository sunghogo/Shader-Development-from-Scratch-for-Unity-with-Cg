Shader "Holistic/CustomBlinn" {
    Properties {
        _Color ("Color", Color) = (1, 1, 1, 1)
    }

    SubShader{
        CGPROGRAM
        #pragma surface surf CustomBlinn

        half4 LightingCustomBlinn(SurfaceOutput s, half3 lightDir, half3 viewDir, half atten) {
            half3 H = normalize(normalize(lightDir) + normalize(viewDir));
            float HdotN = max(0, dot(H, normalize(s.Normal)));

            half diffuse = max(0, dot(normalize(lightDir), normalize(s.Normal)));

            float spec = pow(HdotN, 48.0);
            
            half4 c;
            c.rgb = (s.Albedo * _LightColor0.rgb * diffuse + _LightColor0.rgb * spec) * atten;
            c.a = s.Alpha;
            return c;
        }

        fixed4 _Color;

        struct Input {
            float2 uv_MainTex;
        };

        void surf(Input IN, inout SurfaceOutput o) {
            o.Albedo = _Color.rgb;
        }

        ENDCG
    }

    Fallback "Diffuse"
}