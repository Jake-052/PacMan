// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

Shader "Custom/Jake/TexelShader"
{
    Properties
    {
        _MainTex ("MainTex",2D) = "white"{}
        _Diffuse ("Diffuse", Color) = (1,1,1,1)
        _Specular("Specular",Color) = (1,1,1,1)
        _Gloss("Gloss",Range(8.0,256)) = 20
    }
    SubShader
    {
        Pass
        {
            Tags { "LightModel"="ForwardBase" }
            CGPROGRAM
        
            #pragma vertex vert
            #pragma fragment frag

            #include "Lighting.cginc"

            fixed4 _Diffuse;
            sampler2D _MainTex;
            float4 _MainTex_ST;
            fixed4 _Specular;
            float _Gloss;

            struct a2v
            {
                float4 vertex:POSITION;
                float3 normal:NORMAL;
                float4 texcoord:TEXCOORD0;                
            };
        
            struct v2f
            {
                float4 pos : SV_POSITION;
                float3 worldNormal : TEXCOORD0;
                float3 worldPos :TEXCOORD1;
                float2 uv : TEXCOORD2;                
            };

            v2f vert(a2v v)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.worldNormal = UnityObjectToWorldNormal(v.normal);
                o.worldPos = mul(unity_ObjectToWorld,v.vertex).xyz;
                o.uv = v.texcoord.xy * _MainTex_ST.xy + _MainTex_ST.zw;
                return o;
            };

            fixed4 frag(v2f i):SV_TARGET
            {
                fixed3 albedo = tex2D(_MainTex,i.uv).xyz *_Diffuse.xyz;

                fixed3 ambient = UNITY_LIGHTMODEL_AMBIENT.xyz*albedo;
                
                fixed3 worldLightDir = normalize(_WorldSpaceLightPos0.xyz);
                fixed3 worldNormalDir = normalize(i.worldNormal);
                fixed3 diffuse = _LightColor0*albedo*(saturate(dot(worldLightDir,worldNormalDir)));

                fixed3 viewDir = normalize(UnityWorldSpaceViewDir(i.worldPos));
                fixed3 halfDir = normalize(viewDir+worldLightDir);
                fixed3 specular = _LightColor0*_Specular*(pow(max(0,saturate(dot(viewDir,halfDir))),_Gloss));
                //specular = fixed4(0,0,0,0);
                return fixed4(ambient+albedo+specular,1.0);

            }

            ENDCG
        }
    }
    FallBack "Specular"
}
