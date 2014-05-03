using System.Linq;
using System.Security.Policy;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using TestUtility;
using TestUtility.Contexts;

namespace Core.Tests.Services
{
	[TestClass]
	public class EntitiesServiceTests
	{
		[TestMethod]
		public void
		CanCreatePlayerWithoutSaveChanges()
		{
			using (var context = new BasicContext()) {
				AssertX.IsEmpty(context.EntitiesService.Players);
				const string nick  = "Vikingo";
				const string email = "john.doe@example.com";
				var player         = context.EntitiesService.AddPlayer(nick, email, "1234");

				AssertX.IsEmpty(context.EntitiesService.Players);
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
			using (var context = new BasicContext()) {
				AssertX.IsEmpty(context.EntitiesService.Players);
				const string nick  = "Vikingo";
				const string email = "john.doe@example.com";
				context.EntitiesService.AddPlayer(nick, email, "1234");
				context.EntitiesService.SaveChanges();
				var player         = context.EntitiesService.Players.FirstOrDefault();

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
			using (var context = new BasicContext()) {
				AssertX.IsEmpty(context.EntitiesService.Games);
				const string name  = "Tetris";
				var          url   = new Url("www.tetris.com");
				var game           = context.EntitiesService.AddGame(name, url);
				context.EntitiesService.SaveChanges();
				var modelGame      = context.EntitiesService.Games.FirstOrDefault();

				Assert.IsNotNull(modelGame);
				Assert.AreEqual(name,  modelGame.Name);
				AssertX.AreEqual(url,  modelGame.URLFix);
				Assert.AreSame(game,   modelGame);
			}
		}

		[TestMethod]
		public void
		CanAddGamePlayers()
		{
			using (var context = new BasicContext()) {
				var game = context.EntitiesService.AddGame("Tetris", new Url("www.tetris.com"));
				AssertX.IsEmpty(game.Players);
				var player1 = context.EntitiesService.AddPlayer("Player1 Name", "Player1 Email", "1234");
				var player2 = context.EntitiesService.AddPlayer("Player2 Name", "Player2 Email", "1234");
				context.EntitiesService.AddGamePlayers(game, player1, player2);
				Assert.AreEqual(2, game.Players.Count);
			}
		}

		[TestMethod]
		public void
		CanRemoveGamePlayers()
		{
			using (var context = new BasicContext()) {
				var game = context.EntitiesService.AddGame("Tetris", new Url("www.tetris.com"));
				var player1 = context.EntitiesService.AddPlayer("Player1 Name", "Player1 Email", "1234");
				var player2 = context.EntitiesService.AddPlayer("Player2 Name", "Player2 Email", "1234");
				context.EntitiesService.AddGamePlayers(game, player1, player2);
				context.EntitiesService.SaveChanges();

				context.EntitiesService.RemoveGamePlayers(context.EntitiesService.Games.First(), player1);
				context.EntitiesService.SaveChanges();

				AssertX.AreEqual(new[] { "Player2 Name" }, context.EntitiesService.Games.First().Players.Select(p => p.Nick).ToArray());
			}
		}
	}
}
