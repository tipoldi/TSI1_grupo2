using System;
using System.Security.Cryptography;
using System.Text;

namespace Core.Services
{
	class HashService : IHashService
	{
		readonly static RandomNumberGenerator rng     = new RNGCryptoServiceProvider();
		readonly static HashAlgorithm         hashAlg = new SHA256CryptoServiceProvider(); 

		public string
		NewSalt()
		{
			var bytes = new byte[6];
			rng.GetBytes(bytes);
			return Convert.ToBase64String(bytes);
		}

		public string
		GetHash(string password, string salt)
		{
			return Convert.ToBase64String(
				hashAlg.ComputeHash(Encoding.UTF8.GetBytes(password + salt))
			);
		}
	}
}
