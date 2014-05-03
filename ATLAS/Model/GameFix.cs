using System.Security.Policy;

namespace Model
{
	public partial class Game
	{
		public Url
		URLFix
		{
			get {
				return new Url(URL);
			}
			set {
				URL = value.Value;
			}
		}
	}
}