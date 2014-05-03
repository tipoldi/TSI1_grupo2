using Model;

namespace Core.Services
{
	public class EntitiesService : EntitiesServiceBase
	{
		public
		EntitiesService()
		{
			hashService = new HashService();
			model       = new PlatformEntities();
		}

		public override void
		Dispose()
		{
			model.Dispose();
		}
	}
}
