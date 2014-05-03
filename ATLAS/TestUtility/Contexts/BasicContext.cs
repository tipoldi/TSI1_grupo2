using System;
using System.Linq;
using Core.Services;
using Microsoft.Practices.Unity;
using TestUtility.Mocks;

namespace TestUtility.Contexts
{
	public class BasicContext : IDisposable
	{
		readonly UnityContainer container = new UnityContainer();
		public IEntitiesService EntitiesService { get; private set; }

		public
		BasicContext()
		{
			EntitiesService = new MockEntitiesService();
			container
				.RegisterInstance(EntitiesService)
			;
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
			EntitiesService.Dispose();
		}
	}
}