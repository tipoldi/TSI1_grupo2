using System.Globalization;
using Core.Services;

namespace TestUtility.Mocks
{
	public class MockHashService : IHashService
	{
		public string
		NewSalt()
		{
			return "SALT";
		}

		public string
		GetHash(string password, string salt)
		{
			return (password + salt).GetHashCode().ToString(CultureInfo.InvariantCulture);
		}
	}
}