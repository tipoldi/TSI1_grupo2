using System;
using System.Data.Entity;
using System.Linq;
using System.Security.Policy;
using Core.Exceptions;
using Microsoft.Practices.ObjectBuilder2;
using Model;

namespace Core.Services
{
	public abstract class EntitiesServiceBase : IEntitiesService
	{
		protected PlatformEntities model;
		protected IHashService     hashService;

		static T
		AddToModel<T>(IDbSet<T> selector, T value) where T : class
		{
			selector.Add(value);
			return value;
		}

		public void
		SaveChanges()
		{
			model.SaveChanges();
		}

		public Game
		AddGame(string name, Url url)
		{
			return AddToModel(model.Games, new Game {
				Name    = name,
				URLFix  = url
			});
		}

		public IQueryable<Game>
		Games {
			get { return model.Games; }
		}

		public Player
		AddPlayer(string nick, string email, string password)
		{
			var salt = hashService.NewSalt();
			return AddToModel(model.Players, new Player {
				Nick  = nick,
				Email = email,
				Hash  = hashService.GetHash(password, salt),
				Salt  = salt
			});
		}

		public Player
		GetPlayer(long playerID)
		{
			var player = model
				.Players
				.FirstOrDefault(p => p.PlayerID == playerID);
			if (player == null) {
				throw new EntityNotFoundException(typeof(Player), playerID);
			}
			return player;
		}

		public IQueryable<Player>
		Players {
			get { return model.Players; }
		}

		public void
		AddGamePlayers(Game game, params Player[] players)
		{
			players.ForEach(p => game.Players.Add(p));
		}

		public void
		RemoveGamePlayers(Game game, params Player[] players)
		{
			players.ForEach(p => game.Players.Remove(p));
		}

		public abstract void
		Dispose();
	}
}