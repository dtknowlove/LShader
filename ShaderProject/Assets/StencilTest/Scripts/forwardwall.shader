// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "StencilTest/forwardwall"
{
	Properties
    {
        _MainColor ("Color", Color) = (1,1,1,1)
    }
    SubShader
    {
        // No culling or depth
        Cull Off ZWrite Off ZTest Always

        Tags { "Queue" = "Geometry" }

        Pass
        {
            Stencil
            {
                Ref 2
                //丢掉与Wall重叠的区域
                Comp NotEqual
                Pass Replace
                // 此时模板缓冲值为2
            }
            Color[_MainColor]
        }
    }
}
