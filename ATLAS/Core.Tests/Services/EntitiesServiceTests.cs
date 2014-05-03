using System.Linq;
using System.Security.Policy;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using TestUtility;
using TestUtility.Mocks;

namespace Core.Tests.Services
{
	[TestClass]
	public class EntitiesServiceTests
	{
		[TestMethod]
		public void
		CanCreatePlayerWithoutSaveChanges()
		{
			using (var context = new MockEntitiesService())
			{
				AssertX.IsEmpty(context.Players);
				const string nick  = "Vikingo";
				const string email = "john.doe@example.com";
				var player         = context.AddPlayer(nick, email, "1234");

				AssertX.IsEmpty(context.Players);
				Assert.AreEqual(nick,        player.Nick);
				Assert.AreEqual(email,       player.Email);
				Assert.AreEqual(0,           player.State);
				Assert.AreEqual("502959549", player.Hash);
				Assert.AreEqual("SALT",      player.Salt);
			}
		}

		[TestMethod]
		public void
		CanCreatePlayerWithSaveChanges()
		{
			using (var context = new MockEntitiesService())
			{
				AssertX.IsEmpty(context.Players);
				const string nick  = "Vikingo";
				const string email = "john.doe@example.com";
				context.AddPlayer(nick, email, "1234");
				context.SaveChanges();
				var player         = context.Players.FirstOrDefault();

				Assert.IsNotNull(player);
				Assert.AreEqual(nick,  player.Nick);
				Assert.AreEqual(email, player.Email);
				Assert.AreEqual(0,     player.State);
				AssertX.IsNotNullOrEmpty(player.Hash);
				AssertX.IsNotNullOrEmpty(player.Salt);
			}
		}

		[TestMethod]
		public void
		CanCreateGameWithoutSaveChanges()
		{
			using (var context = new MockEntitiesService())
			{
				AssertX.IsEmpty(context.Games);
				const string name  = "Tetris";
				var          url   = new Url("www.tetris.com");
				var game           = context.AddGame(name, url);
				context.SaveChanges();
				var modelGame      = context.Games.FirstOrDefault();

				Assert.IsNotNull(modelGame);
				Assert.AreEqual(name, modelGame.Name);
				AssertX.AreEqual(url,  modelGame.URLFix);
				Assert.AreSame(game, modelGame);
			}
		}

		[TestMethod]
		public void
		CanAddGamePlayers()
		{
			using (var context = new MockEntitiesService())
			{
				var game = context.AddGame("Tetris", new Url("www.tetris.com"));
				AssertX.IsEmpty(game.Players);
				var player1 = context.AddPlayer("Player1 Name", "Player1 Email", "1234");
				var player2 = context.AddPlayer("Player2 Name", "Player2 Email", "1234");
				context.AddGamePlayers(game, player1, player2);
				Assert.AreEqual(2, game.Players.Count);
			}
		}

		[TestMethod]
		public void
		CanRemoveGamePlayers()
		{
			using (var context = new MockEntitiesService())
			{
				var game = context.AddGame("Tetris", new Url("www.tetris.com"));
				var player1 = context.AddPlayer("Player1 Name", "Player1 Email", "1234");
				var player2 = context.AddPlayer("Player2 Name", "Player2 Email", "1234");
				context.AddGamePlayers(game, player1, player2);
				context.SaveChanges();

				context.RemoveGamePlayers(context.Games.First(), player1);
				context.SaveChanges();

				AssertX.AreEqual(new[] { "Player2 Name" }, context.Games.First().Players.Select(p => p.Nick).ToArray());
			}
		}
	}
}
