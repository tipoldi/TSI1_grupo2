using System;
using Core.Services;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using TestUtility.Contexts;

namespace Core.Tests.Services
{
	[TestClass]
	public class HashServiceTests
	{
		[TestMethod]
		public void
		CanGetRandomSalt()
		{
			using (var context = new BasicContext()) {
				var service = context.Resolve<IHashService>();
				var salt = service.NewSalt();
				Console.WriteLine(salt);
			}
		}
	}
}