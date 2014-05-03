using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using Model;

namespace Commands.DataTypes
{
	public class GameData
	{
		static
		GameData()
		{
			Mapper.CreateMap<Game, GameData>();
		}

		public static void
		ConfigureMapper()
		{
			// Used to force static constructor to run.
		}

		public long         GameID  { get; set; }
		public string       Name    { get; set; }
		public string       URL     { get; set; }
		public PlayerData[] Players { get; set; }
	}
}
