namespace Model
{
	public partial class Player
	{
		public enum
		PlayerState
		{
			Offline = 0,
			Online  = 1
		}

		public PlayerState
		StateFix
		{
			get {
				return (PlayerState) State;
			}
			set {
				State = (int) StateFix;
			}
		}
	}
}