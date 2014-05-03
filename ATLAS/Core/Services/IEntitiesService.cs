using System.Linq;
using System.Security.Policy;
using Model;

namespace Core.Services
{
	public interface IEntitiesService
	{
		IQueryable<Game>   Games   { get; }
		IQueryable<Player> Players { get; }

		void
		SaveChanges();

		Game
		AddGame(string name, Url url);

		Player
		AddPlayer(string nick, string email, string password);

		void
		AddGamePlayers(Game game, params Player[] players);

		void
		RemoveGamePlayers(Game game, params Player[] players);

		void
		Dispose();
	}
}