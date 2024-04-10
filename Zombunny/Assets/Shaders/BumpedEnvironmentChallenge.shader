Shader "Holistic/BumpedEnvironemntChallenge" {
    Properties {
        _myNormal("Normal Map", 2D) = "bump" {}
        _myCube("Cube Map", CUBE) = "white" {}
    }

    SubShader {
        CGPROGRAM
            #pragma surface surf Lambert

            sampler2D _myNormal;
            samplerCUBE _myCube;

            struct Input {
                float2 uv_myNormal;
                float3 worldRefl; INTERNAL_DATA

            };

            void surf(Input IN, inout SurfaceOutput o) {
                o.Normal = UnpackNormal(tex2D(_myNormal, IN.uv_myNormal)) * 0.3f;
                o.Albedo = texCUBE(_myCube, WorldReflectionVector(IN, o.Normal)).rgb;
            }

        ENDCG
    }

    Fallback "Diffuse"
}