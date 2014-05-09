using System;
using Core.Services;
using Model;

namespace TestUtility.Mocks
{
	public class MockEntitiesService : EntitiesServiceBase, IDisposable
	{
		public
		MockEntitiesService(PlatformEntities model, IHashService hashService)
		{
			this.hashService = hashService;
			this.model       = model;
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
			tablesInOrder.ForEach(DeleteTable);
		}

		private void
		DeleteTable(string tableName)
		{
			model.Database.ExecuteSqlCommand(string.Format("DELETE [{0}]", tableName));
			Console.WriteLine(@"Deleted table: {0}", tableName);
		}
	}
}
