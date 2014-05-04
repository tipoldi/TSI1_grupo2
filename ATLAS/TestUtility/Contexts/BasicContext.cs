using System;
using System.Linq;
using Core.Services;
using Microsoft.Practices.Unity;
using Model;
using TestUtility.Mocks;

namespace TestUtility.Contexts
{
	public class BasicContext : IDisposable
	{
		readonly UnityContainer container = new UnityContainer();

		public IEntitiesService Entities { get; private set; }


		public
		BasicContext()
		{
			container
				.RegisterInstance(new PlatformEntities())
				.RegisterType<IHashService,     MockHashService>()
				.RegisterType<IEntitiesService, MockEntitiesService>()
			;
			Entities = Resolve<IEntitiesService>();
		}

		public T
		Resolve<T>()
		{
			var childContainer = container.CreateChildContainer();
			return childContainer.Resolve<T>();
		}

		public T
		Resolve<T>(object className)
		{
			var childContainer = container.CreateChildContainer();
			Register(childContainer, className);
			return childContainer.Resolve<T>();
		}

		void
		Register(IUnityContainer childContainer, object className)
		{
			container.BuildUp(className.GetType(), className);
			var interfaces = className.GetType().GetInterfaces();
			if (interfaces.Any()) {
				foreach (var iType in interfaces) {
					childContainer.RegisterInstance(iType, className);
				}
			}
			else {
				childContainer.RegisterInstance(className);
			}
		}

		public void
		Dispose()
		{
			Entities.Dispose();
		}
	}
}