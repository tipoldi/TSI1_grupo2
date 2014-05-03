using AutoMapper;
using Model;
using PlayerState = Model.Player.PlayerState;

namespace Commands.DataTypes
{
	public class PlayerData
	{
		static
		PlayerData()
		{
			Mapper.CreateMap<Player, PlayerData>();
			GameData.ConfigureMapper();
		}

		public static void
		ConfigureMapper()
		{
			// Used to force static constructor to run.
		}

		public long        PlayerID { get; set; }
		public string      Nick     { get; set; }
		public string      Email    { get; set; }
		public PlayerState State    { get; set; }
		public GameData[]  Games    { get; set; }
	}
}
