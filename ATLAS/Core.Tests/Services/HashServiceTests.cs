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
		CanGetSalt()
		{
			using (var context = new BasicContext()) {
				var service = context.Resolve<IHashService>();
				Assert.AreEqual("SALT", service.NewSalt());
			}
		}
	}
}