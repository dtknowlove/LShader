using System.Collections.Generic;
using UnityEngine;

namespace LPro.LShader.Sample
{
	public class TestBounce : MonoBehaviour
	{
		public List<ElasticObject> Objs;

		private Ray mRay;
		private RaycastHit mHit;

		void Start()
		{
			Debug.Log(Mathf.Infinity);
		}
		
		void Update()
		{
			if (Input.GetMouseButtonDown(0))
			{
				mRay = Camera.main.ScreenPointToRay(Input.mousePosition);
				if (Physics.Raycast(mRay, out mHit, 1000))
				{
					Objs.ForEach(t => t.OnElastic(mHit));
				}
			}
			Debug.DrawRay(mRay.origin, mRay.direction, Color.red);
		}
	}
}
