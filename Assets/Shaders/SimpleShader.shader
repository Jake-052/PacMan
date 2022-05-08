Shader "Unity Shaders Book/Chapter 5/Simple Shader"
{
	Properties
	{
		_Color ("Color Tint",color) = (1.0,1.0,1.0,1.0)

	}

	SubShader
	{
		Pass
		{
			CGPROGRAM

			#pragma vertex vert
			#pragma fragment frag

			fixed4 _Color;

			struct a2v {
				//模型空间顶点坐标
				float4 vertex : POSITION;
				//法线
				float3 normal : NORMAL;
				//第一套材质
				float4 texcoord : TEXCOORD0;
			};

			struct v2f { 
				//裁剪空间顶点坐标
				float4 pos : SV_POSITION;
				//颜色信息
				fixed3 color : COLOR0;
			};
			
			v2f vert(a2v v) {
				v2f o;
				o.pos = UnityObjectToClipPos(v.vertex);
				o.color = v.normal * 0.5 + fixed3(0.5,0.5,0.5);
				return o;
			}


			fixed4 frag(v2f i) : SV_Target {
				fixed3 c = i.color;
				c *=_Color.rgb;
				return fixed4(c,1.0);
			}

			ENDCG
		}
	}
}
