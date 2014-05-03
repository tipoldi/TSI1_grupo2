using System.Security.Policy;
using AutoMapper;
using Commands.DataTypes;
using Core.Services;

namespace Commands.Administrator
{
	public class GameCommand
	{
		readonly IEntitiesService entitiesService;

		public
		GameCommand(IEntitiesService entitiesService)
		{
			this.entitiesService = entitiesService;
		}

		public GameData
		AddGame(string name, Url url)
		{
			var game = entitiesService.AddGame(name, url);
			entitiesService.SaveChanges();
			return Mapper.Map(game, new GameData());
		}
	}
}
