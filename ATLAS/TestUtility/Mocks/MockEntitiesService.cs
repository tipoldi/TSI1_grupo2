using System;
using Core.Services;
using Model;

namespace TestUtility.Mocks
{
	public class MockEntitiesService : EntitiesServiceBase, IDisposable
	{
		public
		MockEntitiesService()
		{
			hashService = new MockHashService();
			model       = new PlatformEntities();
		}

		public override void
		Dispose()
		{
			CleanModel();
			model.Dispose();
		}

		void
		CleanModel()
		{
			var tablesInOrder = new[] {"Player", "Game", "GamePlayer"};
			model.Database.ExecuteSqlCommand("DELETE [Player]");
			model.Database.ExecuteSqlCommand("DELETE [Game]");
			model.Database.ExecuteSqlCommand("DELETE [GamePlayer]");
		}

		private void
		DeleteTable(string tableName)
		{
			model.Database.ExecuteSqlCommand(string.Format("DELETE [{0}]", tableName));
			Console.WriteLine(string.Format("Deleted table: {0}", tableName));
		}
	}
}
