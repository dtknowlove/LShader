Shader "StencilTest/backwardwall"
{
   Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
        // No culling or depth
        Cull Off ZWrite Off ZTest Always

        Tags { "Queue" = "Transparent" }

        Pass
        {
            Stencil
            {
                Ref 2
                Comp Equal 
                //显示与InfrontWall重叠的区域
            }
            SetTexture[_MainTex]{}
        }
    }
}
