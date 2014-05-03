using System;
using Core.Services;
using Microsoft.Practices.Unity;
using Model;

namespace TestUtility.Mocks
{
	public class MockEntitiesService : EntitiesServiceBase, IDisposable
	{
		readonly UnityContainer container = new UnityContainer();

		public
		MockEntitiesService()
		{
			hashService = new MockHashService();
			model       = new PlatformEntities();
			container
				.RegisterInstance(hashService)
				.RegisterInstance(model)
			;
		}

		public void
		Dispose()
		{
			CleanModel();
			model.Dispose();
		}

		void
		CleanModel()
		{
			model.Database.ExecuteSqlCommand("DELETE [Player]");
			model.Database.ExecuteSqlCommand("DELETE [Game]");
			model.Database.ExecuteSqlCommand("DELETE [GamePlayer]");
		}
	}
}
