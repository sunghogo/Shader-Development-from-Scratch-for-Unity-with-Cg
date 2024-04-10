Shader "Holistic/NormalPlay" {
    Properties {
        _myX("Rx", Range(-10,10)) = 1
        _myY("Ry", Range(-10,10)) = 1
        _myZ("Rz", Range(-10,10)) = 1
    }

    SubShader {
        CGPROGRAM
        #pragma surface surf Lambert

        half _myX;
        half _myY;
        half _myZ;

        struct Input {
            float2 uv_myDiffuse;
        };

        void surf(Input IN, inout SurfaceOutput o) {
            o.Albedo = 1;
            o.Normal = float3(_myX, _myY, _myZ);
        }
        
        ENDCG
    }
    FallBack "Diffuse"
}