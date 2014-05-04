using System.Linq;
using System.Security.Policy;
using Core.Exceptions;
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
				AssertX.IsEmpty(context.Entities.Players);
				const string nick  = "Vikingo";
				const string email = "john.doe@example.com";
				var player         = context.Entities.AddPlayer(nick, email, "1234");

				AssertX.IsEmpty(context.Entities.Players);
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
				AssertX.IsEmpty(context.Entities.Players);
				const string nick  = "Vikingo";
				const string email = "john.doe@example.com";
				context.Entities.AddPlayer(nick, email, "1234");
				context.Entities.SaveChanges();
				var player         = context.Entities.Players.FirstOrDefault();

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
				AssertX.IsEmpty(context.Entities.Games);
				const string name  = "Tetris";
				var          url   = new Url("www.tetris.com");
				var game           = context.Entities.AddGame(name, url);
				context.Entities.SaveChanges();
				var modelGame      = context.Entities.Games.FirstOrDefault();

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
				var game = context.Entities.AddGame("Tetris", new Url("www.tetris.com"));
				AssertX.IsEmpty(game.Players);
				var player1 = context.Entities.AddPlayer("Player1 Name", "Player1 Email", "1234");
				var player2 = context.Entities.AddPlayer("Player2 Name", "Player2 Email", "1234");
				context.Entities.AddGamePlayers(game, player1, player2);
				Assert.AreEqual(2, game.Players.Count);
			}
		}

		[TestMethod]
		public void
		CanRemoveGamePlayers()
		{
			using (var context = new BasicContext()) {
				var game = context.Entities.AddGame("Tetris", new Url("www.tetris.com"));
				var player1 = context.Entities.AddPlayer("Player1 Name", "Player1 Email", "1234");
				var player2 = context.Entities.AddPlayer("Player2 Name", "Player2 Email", "1234");
				context.Entities.AddGamePlayers(game, player1, player2);
				context.Entities.SaveChanges();

				context.Entities.RemoveGamePlayers(context.Entities.Games.First(), player1);
				context.Entities.SaveChanges();

				AssertX.AreEqual(new[] { "Player2 Name" }, context.Entities.Games.First().Players.Select(p => p.Nick).ToArray());
			}
		}

		[TestMethod]
		public void
		CanGetPlayer()
		{
			using (var context = new BasicContext()) {
				var player = context.Entities.AddPlayer("Vikingo", "john.doe@example.com", "1234");
				context.Entities.SaveChanges();

				var existing = context.Entities.GetPlayer(player.PlayerID);
				Assert.AreEqual(existing.Nick, player.Nick);

				var nonExistingID = context.Entities.Players.Max(p => p.PlayerID) + 1;
				AssertX.AssertThrows<EntityNotFoundException>(() => context.Entities.GetPlayer(nonExistingID), string.Format("Player with PlayerID = {0} not found.", nonExistingID));
			}
		}
	}
}
