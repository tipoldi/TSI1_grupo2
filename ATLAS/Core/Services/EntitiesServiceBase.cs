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

		public void
		AddClanPlayer(Clan clan, Player player)
		{
			throw new System.NotImplementedException();
		}

		public Clan
		AddClan()
		{
			throw new System.NotImplementedException();
		}

		public Element
		AddElement()
		{
			throw new System.NotImplementedException();
		}

		public Resource
		AddResource()
		{
			throw new System.NotImplementedException();
		}

		public Building
		AddBuilding()
		{
			throw new System.NotImplementedException();
		}

		public Tech
		AddTech()
		{
			throw new System.NotImplementedException();
		}

		public Unit
		AddUnit()
		{
			throw new System.NotImplementedException();
		}

		public Move
		AddMove()
		{
			throw new System.NotImplementedException();
		}

		public MoveType
		AddMoveType()
		{
			throw new System.NotImplementedException();
		}

		public void
		AddMoveTypeElements(MoveType moveType, ElementType[] elementsTypes)
		{
			throw new System.NotImplementedException();
		}

		public ElementType
		AddElementType()
		{
			throw new System.NotImplementedException();
		}

		public Developer
		AddDeveloper()
		{
			throw new System.NotImplementedException();
		}

		public Price
		AddPrice()
		{
			throw new System.NotImplementedException();
		}

		public UnitType
		AddUnitType()
		{
			throw new System.NotImplementedException();
		}

		public TechType
		AddTechType()
		{
			throw new System.NotImplementedException();
		}

		public BuildingType
		AddBuildingType()
		{
			throw new System.NotImplementedException();
		}

		public ResourceType
		AddResourceType()
		{
			throw new System.NotImplementedException();
		}

		public Game
		GetGame(long gameID)
		{
			throw new System.NotImplementedException();
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

		public Clan
		GetClan(long clanID)
		{
			throw new System.NotImplementedException();
		}

		public Element
		GetElement(long elementID)
		{
			throw new System.NotImplementedException();
		}

		public Resource
		GetResource(long resourceID)
		{
			throw new System.NotImplementedException();
		}

		public Building
		GetBuilding(long buildingID)
		{
			throw new System.NotImplementedException();
		}

		public Tech
		GetTech(long techID)
		{
			throw new System.NotImplementedException();
		}

		public Unit
		GetUnit(long unitID)
		{
			throw new System.NotImplementedException();
		}

		public Move
		GetMove(long moveID)
		{
			throw new System.NotImplementedException();
		}

		public MoveType
		GetMoveType(long moveTypeID)
		{
			throw new System.NotImplementedException();
		}

		public ElementType
		GetElementType(long elementTypeID)
		{
			throw new System.NotImplementedException();
		}

		public Developer
		GetDeveloper(long developerID)
		{
			throw new System.NotImplementedException();
		}

		public Price
		GetPrice(long priceID)
		{
			throw new System.NotImplementedException();
		}

		public UnitType
		GetUnitType(long unitTypeID)
		{
			throw new System.NotImplementedException();
		}

		public TechType
		GetTechType(long techTypeID)
		{
			throw new System.NotImplementedException();
		}

		public BuildingType
		GetBuildingType(long buildingTypeID)
		{
			throw new System.NotImplementedException();
		}

		public ResourceType
		GetResourceType(long resourceTypeID)
		{
			throw new System.NotImplementedException();
		}

		public IQueryable<Game>
		Games { get { return model.Games; } }

		public IQueryable<Player>
		Players { get { return model.Players; } }

		//TODO
		public IQueryable<ResourceType>
		ResourceTypes { get { return new ResourceType[]{}.AsQueryable(); } }

		public IQueryable<Clan>
		Clans { get { return new Clan[]{}.AsQueryable(); } }

		public IQueryable<Element>
		Elements { get { return new Element[]{}.AsQueryable(); } }

		public IQueryable<Resource>
		Resources { get { return new Resource[]{}.AsQueryable(); } }

		public IQueryable<Building>
		Buildings { get { return new Building[]{}.AsQueryable(); } }

		public IQueryable<Tech>
		Techs { get { return new Tech[]{}.AsQueryable(); } }

		public IQueryable<Unit>
		Units { get { return new Unit[]{}.AsQueryable(); } }

		public IQueryable<Move>
		Moves { get { return new Move[]{}.AsQueryable(); } }

		public IQueryable<MoveType>
		MoveTypes { get { return new MoveType[]{}.AsQueryable(); } }

		public IQueryable<ElementType>
		ElementTypes { get { return new ElementType[]{}.AsQueryable(); } }

		public IQueryable<Developer>
		Developer { get { return new Developer[]{}.AsQueryable(); } }

		public IQueryable<Price>
		Prices { get { return new Price[]{}.AsQueryable(); } }

		public IQueryable<UnitType>
		UnitTypes { get { return new UnitType[]{}.AsQueryable(); } }

		public IQueryable<TechType>
		TechTypes { get { return new TechType[]{}.AsQueryable(); } }

		public IQueryable<BuildingType>
		BuildingTypes { get { return new BuildingType[]{}.AsQueryable(); } }

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