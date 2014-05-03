namespace Core.Services
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
			return (password + salt).GetHashCode().ToString();
		}
	}
}