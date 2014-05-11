using Core.Services;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Core.Tests.Services
{
	[TestClass]
	public class PersistenceServiceTests
	{
		[TestMethod, Ignore]
		public void
		CanCreateNewGameDB()
		{
			var service = new PersistenceService("SQLEXPRESS");
			service.CreateGameDB(60);
		}
	}
}