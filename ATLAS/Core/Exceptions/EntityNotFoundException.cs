using System;
using System.Globalization;
using System.Linq;
using Core.Properties;

namespace Core.Exceptions
{
	public class EntityNotFoundException : Exception
	{
		public
		EntityNotFoundException(Type entityType, long entityID) : base(string.Format(CultureInfo.InvariantCulture, Resources.EntityNotFoundException, entityType.ToString().Split('.').Last(), entityID))
		{
		}
	}
}