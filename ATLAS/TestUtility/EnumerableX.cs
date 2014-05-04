using System;
using System.Collections.Generic;

namespace TestUtility
{
	internal static class EnumerableX
	{
		public static void
		ForEach<T>(this IEnumerable<T> collection, Action<T> action) {
			foreach(var item in collection) {
				action(item);
			}
		}
	}
}