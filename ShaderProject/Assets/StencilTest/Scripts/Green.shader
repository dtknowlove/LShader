// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "StencilTest/Green"
{
	SubShader
	{
		Tags { "RenderType"="Opaque" "Oueue"="Geometry+1"}
		Pass
		{
		    Stencil
		    {
		        Ref 2
		        Comp equal
		        Pass keep
		        Fail decrWrap
		        ZFail keep
		    }
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			// make fog work
			#pragma multi_compile_fog
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
			};

			struct v2f
			{
				float4 pos : SV_POSITION;
			};

			sampler2D _MainTex;
			float4 _MainTex_ST;
			
			v2f vert (appdata v)
			{
				v2f o;
				o.pos=UnityObjectToClipPos(v.vertex);
				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{
				return half4(0,1,0,1);
			}
			ENDCG
		}
	}
}
