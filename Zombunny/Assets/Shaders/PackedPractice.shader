Shader "Holistic/PackedPractice" {
    Properties {
        _myColor ("Example Color", Color) = (1,1,1,1)
    }

    SubShader {
        CGPROGRAM
            #pragma surface surf Lambert
            
            struct Input {
                float2 uvMainTex;
            };

            fixed4 _myColor;

            void surf (Input IN, inout SurfaceOutput o) {
                // o.Albedo = _myColor.rgb;
                // o.Albedo = _myColor.rbg;
                // o.Albedo.r = _myColor.r;

                // Same
                o.Albedo.x = _myColor.x;
                o.Albedo.r = _myColor.x;

                o.Albedo.rg = _myColor.xy;

            }
            
        ENDCG
    }

    FallBack "Diffuse"

}