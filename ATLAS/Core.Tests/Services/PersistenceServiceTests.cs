using Core.Services;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Core.Tests.Services
{
	[TestClass]
	public class PersistenceServiceTests
	{
		[TestMethod]
		public void
		CanCreateNewGameDB()
		{
			var service = new PersistenceService("SQLEXPRESS");
			const long gameID = 60;
			service.CreateGameDB(gameID);
			service.DeleteGameDB(gameID);
		}
	}
}