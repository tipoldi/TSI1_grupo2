using System.Security.Policy;
using Commands.Administrator;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using TestUtility;
using TestUtility.Contexts;

namespace Commands.Tests.Administrator
{
	[TestClass]
	public class GameCommandTests
	{
		[TestMethod]
		public void
		CanCreateGame()
		{
			using (var context = new BasicContext())
			{
				const string name    = "Tetris";
				var          url     = new Url("www.tetris.com");
				var          command = context.Resolve<GameCommand>();

				AssertX.IsEmpty(context.Entities.Games);
				var          result  = command.AddGame(name, url);
				AssertX.IsNotEmpty(context.Entities.Games);

				Assert.AreEqual(name,      result.Name);
				Assert.AreEqual(url.Value, result.URL);
			}
		}
	}
}
