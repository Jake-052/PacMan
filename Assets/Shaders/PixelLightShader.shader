// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

Shader "Custom/Jake/PixelLightShader"
{
    Properties
    {
        _Diffuse ("Diffuse", Color) = (1,1,1,1)
        _Specular ("Specular", Color) = (1,1,1,1)
        _Gloss ("Gloss",Range(8,256)) = 20
    }
    SubShader
    {
        Pass{

            Tags{"LightMode"="ForwardBase"}

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "Lighting.cginc"

            fixed4 _Diffuse;
            fixed4 _Specular;
            float _Gloss;

            struct a2v
            {
                float4 vertex:POSITION;
                fixed4 normal:NORMAL;
            };

            struct v2f
            {
                fixed4 pos : SV_POSITION;
                fixed3 worldNormal : TEXCOORD0;
                fixed4 worldPos : TEXCOORD1;
            };

            v2f vert(a2v v)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.worldNormal = mul((float3x3)unity_ObjectToWorld,v.normal);
                o.worldPos = mul(unity_ObjectToWorld,v.vertex);
                return o;      
            }

            fixed4 frag(v2f i):SV_TARGET
            {
                fixed3 ambient = UNITY_LIGHTMODEL_AMBIENT.xyz;

                fixed3 worldLightDir = normalize(_WorldSpaceLightPos0.xyz);
                fixed3 worldNormal = normalize(i.worldNormal);
                fixed3 diffuse = (_LightColor0.xyz*_Diffuse.xyz)*saturate(dot(worldLightDir,worldNormal));

                // fixed3 reflectDir =normalize(reflect(-worldLightDir,worldNormal));
                // fixed3 viewDir = normalize(_WorldSpaceCameraPos.xyz-i.worldPos.xyz);
                // fixed3 specular = (_LightColor0.xyz*_Specular.xyz)*pow(saturate(dot(reflectDir,viewDir)),_Gloss);
                fixed3 viewDir = normalize(_WorldSpaceCameraPos.xyz-i.worldPos.xyz);
                fixed3 halfDir = normalize(worldLightDir+viewDir);
                fixed3 specular = (_LightColor0.xyz*_Specular.xyz)*pow(saturate(dot(worldNormal,halfDir)),_Gloss);

                return fixed4(ambient+diffuse+specular,1.0);            
            }
            ENDCG
        }
       
    }
    //FallBack "Diffuse"
}
