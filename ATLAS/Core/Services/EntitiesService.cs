using Microsoft.Practices.Unity;
using Model;

namespace Core.Services
{
	public class EntitiesService : EntitiesServiceBase
	{
		readonly UnityContainer container = new UnityContainer();

		public
		EntitiesService()
		{
			hashService = new HashService();
			model       = new PlatformEntities();
			container
				.RegisterInstance(hashService)
				.RegisterInstance(model)
			;
		}
	}
}
