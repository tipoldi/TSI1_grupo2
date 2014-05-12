using System.Linq;
using System.Security.Policy;
using Model;
using ResourceType = Model.ResourceType;

namespace Core.Services
{
	public interface IEntitiesService
	{
		void SaveChanges();
		void Dispose();

		IQueryable<Game>         Games         { get; }
		IQueryable<Player>       Players       { get; }
		IQueryable<Clan>         Clans         { get; }
		IQueryable<Element>      Elements      { get; }
		IQueryable<Resource>     Resources     { get; }
		IQueryable<Building>     Buildings     { get; }
		IQueryable<Tech>         Techs         { get; }
		IQueryable<Unit>         Units         { get; }
		IQueryable<Move>         Moves         { get; }
		IQueryable<MoveType>     MoveTypes     { get; }
		IQueryable<ElementType>  ElementTypes  { get; }
		IQueryable<Developer>    Developer     { get; }
		IQueryable<Price>        Prices        { get; }
		IQueryable<UnitType>     UnitTypes     { get; }
		IQueryable<TechType>     TechTypes     { get; }
		IQueryable<BuildingType> BuildingTypes { get; }
		IQueryable<ResourceType> ResourceTypes { get; }

		Game         AddGame(string name, Url url);
		void         AddGamePlayers(Game game, params Player[] players);
		Player       AddPlayer(string nick, string email, string password);
		void         AddClanPlayer(Clan clan, Player player);
		Clan         AddClan();
		Element      AddElement();
		Resource     AddResource();
		Building     AddBuilding();
		Tech         AddTech();
		Unit         AddUnit();
		Move         AddMove();
		MoveType     AddMoveType();
		void         AddMoveTypeElements(MoveType moveType, ElementType[] elementsTypes);
		ElementType  AddElementType();
		Developer    AddDeveloper();
		Price        AddPrice();
		UnitType     AddUnitType();
		TechType     AddTechType();
		BuildingType AddBuildingType();
		ResourceType AddResourceType();

		void
		RemoveGamePlayers(Game game, params Player[] players);

		Game         GetGame(long gameID);
		Player       GetPlayer(long playerID);
		Clan         GetClan(long clanID);
		Element      GetElement(long elementID);
		Resource     GetResource(long resourceID);
		Building     GetBuilding(long buildingID);
		Tech         GetTech(long techID);
		Unit         GetUnit(long unitID);
		Move         GetMove(long moveID);
		MoveType     GetMoveType(long moveTypeID);
		ElementType  GetElementType(long elementTypeID);
		Developer    GetDeveloper(long developerID);
		Price        GetPrice(long priceID);
		UnitType     GetUnitType(long unitTypeID);
		TechType     GetTechType(long techTypeID);
		BuildingType GetBuildingType(long buildingTypeID);
		ResourceType GetResourceType(long resourceTypeID);
	}
}