using System;
using System.Collections;
using System.Collections.Generic;
using System.Security.Policy;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace TestUtility
{
	public static class AssertX
	{
		public static void
		AreEqual(Url expected, Url actual)
		{
			Assert.AreEqual(expected.Value, actual.Value);
		}

		public static void
		AreEqual(IEnumerable expected, IEnumerable actual)
		{
			var expArray = ToArray(expected) ?? new ArrayList().ToArray();
			var actArray = ToArray(actual) ?? new ArrayList().ToArray();
			if (expArray.Length == actArray.Length) {
				AreSameSequence(expArray, actArray);
			}
			else {
				Assert.Fail("Enumerables with different sizes.");
			}
		}

		private static void
		AreSameSequence(Array expArray, Array actArray)
		{
			var index   = 0;
			while(index < expArray.Length) {
				Assert.AreSame(expArray.GetValue(index), actArray.GetValue(index));
				index++;
			}
		}

		public static void
		IsEmpty(IEnumerable actual)
		{
			var condition = ToArray(actual).Length == 0;
			Assert.IsTrue(condition);
		}

		public static void
		IsNotEmpty(IEnumerable actual)
		{
			Assert.IsTrue(ToArray(actual).Length > 0);
		}

		public static void
		IsNotNullOrEmpty(IEnumerable actual)
		{
			IsNotNullOrEmpty(ToArray(actual));
		}

		public static void
		IsNotNullOrEmpty(string actual)
		{
			IsNotNullOrEmpty(ToArray(actual));
		}

		public static void
		AssertThrows<T>(Action action, string message = null) where T : Exception
		{
			try {
				action();
			}
			catch (T t) {
				if (message == null || (t.Message == message)) {
					Assert.IsTrue(true);
				}
				else {
					Assert.Fail("{0} was thrown but expected <'{1}'> message is different than <'{2}'>.", typeof (T).Name, t.Message, message);
				}
				return;
			}
			catch (Exception exp) {

				Assert.Fail("{0} was thrown instead {1}.", exp.GetType().Name, typeof (T).Name);
			}
			Assert.Fail("{0} not thrown.", typeof (T).Name);
		}

		static void
		IsNotNullOrEmpty(Array array)
		{
			var notNullOrEmpty = array != null && (array.Length > 0);
			if (notNullOrEmpty) {
				Assert.IsTrue(true);
			}
			else {
				Assert.Fail("Expected to be non null or empty");
			}
		}

		static Array
		ToArray(IEnumerable items)
		{
			if (items == null) {
				return null;
			}
			else {
				var arrayList = new ArrayList();
				((IEnumerable<object>)items).ForEach(i => arrayList.Add(i));
				return arrayList.ToArray();
			}
		}

		static Array
		ToArray(string items)
		{
			return items == null ? null : items.ToCharArray();
		}
	}
}