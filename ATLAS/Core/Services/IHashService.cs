namespace Core.Services
{
	public interface IHashService
	{
		string
		NewSalt();

		string
		GetHash(string password, string salt);
	}
}