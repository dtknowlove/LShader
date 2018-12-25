// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "StencilTest/middlewall"
{
	Properties
    {
        _MainColor ("Color", Color) = (1,1,1,1)
    }
    SubShader
    {
        // No culling or depth
        Cull Off ZWrite Off ZTest Always

        Tags { "Queue" = "Background" }

        Pass
        {
            Stencil
            {
                Ref 9
                Comp Always
                Pass Replace
                //此时，模板缓冲值为9
            }
            Color[_MainColor]
        }
    }
}
