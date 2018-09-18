using UnityEngine;

namespace LPro.LShader
{
	public interface IElastic
	{
		void OnElastic(RaycastHit hit);
	}
	
	public class ElasticObject : MonoBehaviour,IElastic
	{
		private static int s_pos, s_nor, s_time;
		
		static ElasticObject()
		{
			s_pos = Shader.PropertyToID("_Position");
			s_nor = Shader.PropertyToID("_Normal");
			s_time = Shader.PropertyToID("_PointTime");
		}

		[Tooltip("受影响顶点范围的半径")]
		public float Range = 0.6f;
		[Tooltip("反弹力度")]
		public float BounceStrength = 0.2f;
		
		private MeshRenderer mesh;
		private void Start()
		{
			mesh = GetComponent<MeshRenderer>();  
		}
		
		public void OnElastic(RaycastHit hit)
		{
			//反弹的坐标
			Vector4 v = transform.InverseTransformPoint(hit.point);
			//受影响顶点范围的半径
			v.w = Range;
			mesh.material.SetVector(s_pos, v);
			//法线方向，该值为顶点偏移方向，可自己根据需求传。
			v = transform.InverseTransformDirection(hit.normal.normalized);
			//反弹力度
			v.w = BounceStrength;
			mesh.material.SetVector(s_nor, v);
			//重置时间
			mesh.material.SetFloat(s_time, Time.time);
		}
	}
}
