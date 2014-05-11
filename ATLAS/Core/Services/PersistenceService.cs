using System.Diagnostics;
using System.Globalization;
using System.IO;

namespace Core.Services
{
	public class PersistenceService
	{
		private readonly string sqlServerName;

		public
		PersistenceService(string sqlServerName)
		{
			this.sqlServerName = sqlServerName;
		}

		static string
		GetRootDirectory()
		{
			var rootDirectory = Directory.GetCurrentDirectory();
			while (!rootDirectory.ToLower().EndsWith("atlas")) {
				rootDirectory = Directory.GetParent(rootDirectory).FullName;
			}
			return rootDirectory;
		}

		public void
		CreateGameDB(long gameID)
		{
			var gameSchemaPath = GetRootDirectory().Replace('/', '\\') + "\\Model\\GameSchema";
			var process        = new Process {
				StartInfo = {
					UseShellExecute        = false,
					RedirectStandardOutput = true,
					RedirectStandardError  = true,
					CreateNoWindow         = true,
					WindowStyle            = ProcessWindowStyle.Hidden,
					FileName               = string.Format(@"{0}\Scripts\{1}", GetRootDirectory(), "CreateGameDB.bat"),
					Arguments              = string.Format("{0} {1} {2} > testlog.txt 2> testerrors.txt", sqlServerName, gameID.ToString(CultureInfo.InvariantCulture), gameSchemaPath)
				}
			};
			process.Start();
			process.WaitForExit();
		}
	}
}