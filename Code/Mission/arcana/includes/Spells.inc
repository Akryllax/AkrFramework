class CfgSpells
{
	class BaseSpell
	{
		id = -1;
		name = "";
		description = "";
		
		type = "";
		category = "";
		requires[] = {};

		psicost = -1;
		deltapsi = 2;
		toxicity = -1;

		active = -1;
		activeEffect = "";
		pasiveEffect = "";
		duration = -1;
		deltaDuration = 2;

		userefresh = -1;

		spellinit = "";
	};

	class Primary
	{
		class Test : BaseSpell
		{
			id = 1;
			name = "Test spell";
			description = "Lorem ipsum nigga nigga";

			type = "DBG";
			category = "DEF";

			psicost = 10;
			toxicity = 30;

			active = 1;
			activeEffect = "testspell";
			userefresh = 5;
		};
		class Teleport : BaseSpell
		{
			id = 2;
			name = "Teleport";
			description = "Teleports the player a few meters, ";

			type = "PHY";
			category = "PHY";
			
			psicost = 50;
			toxicity = 8;

			active = 1;
			activeEffect = "teleport";
			pasiveEffect = "teleport_passive";

			userefresh = 5;
			spellinit = "teleport_init";
		};
	};

	class Secondary
	{

	};
};
