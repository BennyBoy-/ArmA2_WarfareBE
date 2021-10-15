/*
	Neighbors town per world.
*/

switch (toLower(worldName)) do {
	case "chernarus": {
		switch (missionNamespace getVariable "WFBE_C_TOWNS_AMOUNT") do {
			case 4: {//--- Full.
				Kamenka setVariable ["wfbe_town_neighbors", [Pavlovo, Komarovo]];
				Komarovo setVariable ["wfbe_town_neighbors", [Pavlovo, Komarovo, Bor, Chernogorsk]];
				Chernogorsk setVariable ["wfbe_town_neighbors", [Komarovo, Nadezhdino, Prigorodki, Kozlovka]];
				Prigorodki setVariable ["wfbe_town_neighbors", [Chernogorsk, Elektrozavodsk]];
				Elektrozavodsk setVariable ["wfbe_town_neighbors", [Prigorodki, Chernogorsk, Pusta, Kamyshovo, Staroye]];
				Kamyshovo setVariable ["wfbe_town_neighbors", [Tulga, Elektrozavodsk]];
				Tulga setVariable ["wfbe_town_neighbors", [Kamyshovo, Msta, Solnichniy]];
				Solnichniy setVariable ["wfbe_town_neighbors", [Kamyshovo, Msta, Nizhnoye, Dolina]];
				Nizhnoye setVariable ["wfbe_town_neighbors", [Solnichniy, Berezino]];
				Berezino setVariable ["wfbe_town_neighbors", [Nizhnoye, Khelm, Orlovets, Dubrovka]];
				Khelm setVariable ["wfbe_town_neighbors", [Berezino, Krasnostav]];
				Krasnostav setVariable ["wfbe_town_neighbors", [Olsha, Gvozdno, Dubrovka, Khelm]];
				Olsha setVariable ["wfbe_town_neighbors", [Krasnostav]];
				Gvozdno setVariable ["wfbe_town_neighbors", [Krasnostav, Grishino]];
				Grishino setVariable ["wfbe_town_neighbors", [Gvozdno, Petrovka, Kabanino]];
				Petrovka setVariable ["wfbe_town_neighbors", [Grishino, Lopatino]];
				Lopatino setVariable ["wfbe_town_neighbors", [Petrovka, Vybor, Pustoshka]];
				Myshkino setVariable ["wfbe_town_neighbors", [Sosnovka, Pustoshka]];
				Sosnovka setVariable ["wfbe_town_neighbors", [Zelenogorsk, Myshkino, Pustoshka]];
				Zelenogorsk setVariable ["wfbe_town_neighbors", [Sosnovka, Pogorevka, Kozlovka, Pavlovo]];
				Pavlovo setVariable ["wfbe_town_neighbors", [Kamenka, Komarovo, Bor, Zelenogorsk]];
				Bor setVariable ["wfbe_town_neighbors", [Pavlovo, Kozlovka, Komarovo]];
				Kozlovka setVariable ["wfbe_town_neighbors", [Bor, Zelenogorsk, Nadezhdino, Chernogorsk]];
				Nadezhdino setVariable ["wfbe_town_neighbors", [Kozlovka, Chernogorsk]];
				Mogilevka setVariable ["wfbe_town_neighbors", [Vyshnoye, Pusta]];
				Pusta setVariable ["wfbe_town_neighbors", [Mogilevka, Elektrozavodsk]];
				Staroye setVariable ["wfbe_town_neighbors", [Shakhovka, Guglovo, Elektrozavodsk, Msta]];
				Msta setVariable ["wfbe_town_neighbors", [Staroye, Tulga, Solnichniy]];
				Dolina setVariable ["wfbe_town_neighbors", [Staroye, Solnichniy, Solnichniy, Polana]];
				Orlovets setVariable ["wfbe_town_neighbors", [Berezino, Polana]];
				Polana setVariable ["wfbe_town_neighbors", [Orlovets, Polana, Dolina, Shakhovka, Gorka]];
				Gorka setVariable ["wfbe_town_neighbors", [Dubrovka, NovySobor, Polana]];
				Dubrovka setVariable ["wfbe_town_neighbors", [Gorka, Krasnostav, Berezino]];
				Shakhovka setVariable ["wfbe_town_neighbors", [Staroye, Polana]];
				Guglovo setVariable ["wfbe_town_neighbors", [Staroye, NovySobor]];
				NovySobor setVariable ["wfbe_town_neighbors", [Guglovo, Gorka, StarySobor]];
				Vyshnoye setVariable ["wfbe_town_neighbors", [StarySobor, Gorka]];
				StarySobor setVariable ["wfbe_town_neighbors", [Vyshnoye, NovySobor, Kabanino, Pogorevka]];
				Pulkovo setVariable ["wfbe_town_neighbors", [Pogorevka]];
				Pogorevka setVariable ["wfbe_town_neighbors", [Pulkovo, Zelenogorsk, StarySobor]];
				Kabanino setVariable ["wfbe_town_neighbors", [Vybor, Grishino, StarySobor]];
				Vybor setVariable ["wfbe_town_neighbors", [Kabanino, Lopatino, Pustoshka]];
				Pustoshka setVariable ["wfbe_town_neighbors", [Kabanino, Vybor, Myshkino]];
			};
			case 3: {//--- Large.
				Chernogorsk setVariable ["wfbe_town_neighbors", [Komarovo, Nadezhdino, Elektrozavodsk]];
				Elektrozavodsk setVariable ["wfbe_town_neighbors", [Chernogorsk, Pusta, Kamyshovo, Staroye]];
				Kamyshovo setVariable ["wfbe_town_neighbors", [Solnichniy, Elektrozavodsk]];
				Solnichniy setVariable ["wfbe_town_neighbors", [Kamyshovo, Dolina, Berezino]];
				Berezino setVariable ["wfbe_town_neighbors", [Solnichniy, Dubrovka]];
				Krasnostav setVariable ["wfbe_town_neighbors", [Gvozdno, Dubrovka]];
				Dubrovka setVariable ["wfbe_town_neighbors", [Gorka, Krasnostav, Berezino]];
				Gorka setVariable ["wfbe_town_neighbors", [Dubrovka, Polana, StarySobor]];
				Polana setVariable ["wfbe_town_neighbors", [Gorka, Dolina]];
				Dolina setVariable ["wfbe_town_neighbors", [Polana, Solnichniy, Staroye]];
				Staroye setVariable ["wfbe_town_neighbors", [Elektrozavodsk, Dolina, Guglovo]];
				Pusta setVariable ["wfbe_town_neighbors", [Elektrozavodsk, Mogilevka]];
				Guglovo setVariable ["wfbe_town_neighbors", [Staroye, StarySobor]];
				Mogilevka setVariable ["wfbe_town_neighbors", [Pusta, Vyshnoye, Nadezhdino]];
				Vyshnoye setVariable ["wfbe_town_neighbors", [Mogilevka, StarySobor]];
				StarySobor setVariable ["wfbe_town_neighbors", [Mogilevka, Kabanino, Gorka, Pogorevka, Guglovo]];
				Gvozdno setVariable ["wfbe_town_neighbors", [Grishino, Krasnostav]];
				Grishino setVariable ["wfbe_town_neighbors", [Kabanino, Petrovka, Gvozdno]];
				Kabanino setVariable ["wfbe_town_neighbors", [StarySobor, Grishino, Vybor]];
				Petrovka setVariable ["wfbe_town_neighbors", [Grishino, Lopatino]];
				Lopatino setVariable ["wfbe_town_neighbors", [Vybor, Petrovka]];
				Vybor setVariable ["wfbe_town_neighbors", [Lopatino, Myshkino, Kabanino]];
				Pogorevka setVariable ["wfbe_town_neighbors", [StarySobor, Zelenogorsk]];
				Myshkino setVariable ["wfbe_town_neighbors", [Zelenogorsk, Lopatino]];
				Nadezhdino setVariable ["wfbe_town_neighbors", [Mogilevka, Chernogorsk]];
				Zelenogorsk setVariable ["wfbe_town_neighbors", [Pogorevka, Myshkino, Pavlovo]];
				Pavlovo setVariable ["wfbe_town_neighbors", [Zelenogorsk, Komarovo]];
				Komarovo setVariable ["wfbe_town_neighbors", [Pavlovo, Chernogorsk]];
			};
			case 2: {//--- Medium.
				Chernogorsk setVariable ["wfbe_town_neighbors", [Komarovo, Nadezhdino, Kozlovka, Mogilevka]];
				Mogilevka setVariable ["wfbe_town_neighbors", [Vyshnoye, Nadezhdino]];
				Vyshnoye setVariable ["wfbe_town_neighbors", [Mogilevka, StarySobor]];
				StarySobor setVariable ["wfbe_town_neighbors", [Mogilevka, Kabanino, Pogorevka]];
				Grishino setVariable ["wfbe_town_neighbors", [Kabanino]];
				Kabanino setVariable ["wfbe_town_neighbors", [StarySobor, Grishino, Vybor]];
				Lopatino setVariable ["wfbe_town_neighbors", [Vybor]];
				Vybor setVariable ["wfbe_town_neighbors", [Lopatino, Pustoshka, Kabanino]];
				Myshkino setVariable ["wfbe_town_neighbors", [Zelenogorsk, Pustoshka]];
				Nadezhdino setVariable ["wfbe_town_neighbors", [Mogilevka, Chernogorsk]];
				Zelenogorsk setVariable ["wfbe_town_neighbors", [Pogorevka, Myshkino, Pavlovo, Kozlovka]];
				Pavlovo setVariable ["wfbe_town_neighbors", [Zelenogorsk, Komarovo, Kamenka]];
				Komarovo setVariable ["wfbe_town_neighbors", [Pavlovo, Chernogorsk, Kamenka]];
				Kamenka setVariable ["wfbe_town_neighbors", [Pavlovo, Komarovo]];
				Kozlovka setVariable ["wfbe_town_neighbors", [Zelenogorsk, Nadezhdino, Chernogorsk]];
				Pustoshka setVariable ["wfbe_town_neighbors", [Vybor, Myshkino]];
				Pogorevka setVariable ["wfbe_town_neighbors", [StarySobor, Zelenogorsk]];
			};
			case 1: {//--- Small.
				Berezino setVariable ["wfbe_town_neighbors", [Khelm, Orlovets, Dubrovka]];
				Orlovets setVariable ["wfbe_town_neighbors", [Berezino, Polana]];
				Polana setVariable ["wfbe_town_neighbors", [Gorka, Orlovets]];
				Gorka setVariable ["wfbe_town_neighbors", [Dubrovka, Polana]];
				Dubrovka setVariable ["wfbe_town_neighbors", [Gorka, Krasnostav, Berezino]];
				Khelm setVariable ["wfbe_town_neighbors", [Berezino, Krasnostav]];
				Krasnostav setVariable ["wfbe_town_neighbors", [Olsha, Gvozdno, Dubrovka, Khelm]];
				Olsha setVariable ["wfbe_town_neighbors", [Krasnostav]];
				Gvozdno setVariable ["wfbe_town_neighbors", [Krasnostav]];
			};
			case 0: {//--- Extra Small.
				Grishino setVariable ["wfbe_town_neighbors", [Kabanino]];
				Kabanino setVariable ["wfbe_town_neighbors", [Grishino, Vybor]];
				Vybor setVariable ["wfbe_town_neighbors", [Kabanino, Lopatino, Pustoshka]];
				Pustoshka setVariable ["wfbe_town_neighbors", [Vybor]];
				Lopatino setVariable ["wfbe_town_neighbors", [Vybor]];
			};
		};	
	};
	case "takistan": {
		switch (missionNamespace getVariable "WFBE_C_TOWNS_AMOUNT") do {
			case 4: {//--- Full.
				Landay setVariable ["wfbe_town_neighbors", [ChakChak]];
				ChakChak setVariable ["wfbe_town_neighbors", [Landay, Sakhee, Huzrutimam]];
				Huzrutimam setVariable ["wfbe_town_neighbors", [ChakChak, Sultansafee]];
				Sultansafee setVariable ["wfbe_town_neighbors", [Huzrutimam, LoyManara]];
				LoyManara setVariable ["wfbe_town_neighbors", [Sultansafee, Jaza, Chardarakht, Timurkalay]];
				Jaza setVariable ["wfbe_town_neighbors", [LoyManara]];
				Chardarakht setVariable ["wfbe_town_neighbors", [LoyManara, HazarBagh]];
				HazarBagh setVariable ["wfbe_town_neighbors", [Chardarakht]];
				Timurkalay setVariable ["wfbe_town_neighbors", [LoyManara, Anar, Garmarud]];
				Garmarud setVariable ["wfbe_town_neighbors", [Timurkalay, Garmsar, Imarat]];
				Garmsar setVariable ["wfbe_town_neighbors", [Garmarud]];
				Imarat setVariable ["wfbe_town_neighbors", [Garmarud, Zavarak, Bastam]];
				Zavarak setVariable ["wfbe_town_neighbors", [Imarat, Karachinar, Ravanay]];
				Karachinar setVariable ["wfbe_town_neighbors", [Zavarak]];
				Ravanay setVariable ["wfbe_town_neighbors", [Zavarak]];
				Bastam setVariable ["wfbe_town_neighbors", [Imarat, Falar, Rasman, Gospandi]];
				Rasman setVariable ["wfbe_town_neighbors", [Shamali, Bastam]];
				Shamali setVariable ["wfbe_town_neighbors", [Rasman, Nagara]];
				Nagara setVariable ["wfbe_town_neighbors", [Nur, Gospandi, Shamali]];
				Nur setVariable ["wfbe_town_neighbors", [Nagara]];
				Gospandi setVariable ["wfbe_town_neighbors", [Nagara, Bastam, Mulladoost]];
				Mulladoost setVariable ["wfbe_town_neighbors", [Gospandi, Khushab]];
				Khushab setVariable ["wfbe_town_neighbors", [Mulladoost, Jilavur, Shukurkalay]];
				Shukurkalay setVariable ["wfbe_town_neighbors", [Khushab, Jilavur, Chaman]];
				Chaman setVariable ["wfbe_town_neighbors", [Shukurkalay]];
				Jilavur setVariable ["wfbe_town_neighbors", [Shukurkalay, Khushab, Sakhee, FeeruzAbad]];
				Sakhee setVariable ["wfbe_town_neighbors", [Jilavur, ChakChak, FeeruzAbad, Kakaru]];
				Kakaru setVariable ["wfbe_town_neighbors", [Sakhee, Anar, FeeruzAbad]];
				FeeruzAbad setVariable ["wfbe_town_neighbors", [Jilavur, Anar, Kakaru, Falar, Sakhee]];
				Anar setVariable ["wfbe_town_neighbors", [FeeruzAbad, Kakaru, Timurkalay, Falar]];
				Falar setVariable ["wfbe_town_neighbors", [FeeruzAbad, Anar, Bastam]];
			};
			case 3: {//--- Large.
				Landay setVariable ["wfbe_town_neighbors", [ChakChak]];
				ChakChak setVariable ["wfbe_town_neighbors", [Landay, Sakhee, Huzrutimam]];
				Huzrutimam setVariable ["wfbe_town_neighbors", [ChakChak, Sultansafee]];
				Sultansafee setVariable ["wfbe_town_neighbors", [Huzrutimam, LoyManara]];
				LoyManara setVariable ["wfbe_town_neighbors", [Sultansafee, Jaza, Chardarakht, Timurkalay]];
				Jaza setVariable ["wfbe_town_neighbors", [LoyManara]];
				Chardarakht setVariable ["wfbe_town_neighbors", [LoyManara]];
				Timurkalay setVariable ["wfbe_town_neighbors", [LoyManara, Anar, Garmarud]];
				Garmarud setVariable ["wfbe_town_neighbors", [Timurkalay, Garmsar, Imarat]];
				Garmsar setVariable ["wfbe_town_neighbors", [Garmarud]];
				Imarat setVariable ["wfbe_town_neighbors", [Garmarud, Zavarak, Bastam]];
				Zavarak setVariable ["wfbe_town_neighbors", [Imarat, Karachinar, Ravanay]];
				Karachinar setVariable ["wfbe_town_neighbors", [Zavarak]];
				Ravanay setVariable ["wfbe_town_neighbors", [Zavarak]];
				Bastam setVariable ["wfbe_town_neighbors", [Imarat, Falar, Rasman, Gospandi]];
				Rasman setVariable ["wfbe_town_neighbors", [Shamali, Bastam]];
				Shamali setVariable ["wfbe_town_neighbors", [Rasman, Nagara]];
				Nagara setVariable ["wfbe_town_neighbors", [Gospandi, Shamali]];
				Gospandi setVariable ["wfbe_town_neighbors", [Nagara, Bastam, Mulladoost]];
				Mulladoost setVariable ["wfbe_town_neighbors", [Gospandi, Khushab]];
				Khushab setVariable ["wfbe_town_neighbors", [Mulladoost, Jilavur, Shukurkalay]];
				Shukurkalay setVariable ["wfbe_town_neighbors", [Khushab, Jilavur]];
				Jilavur setVariable ["wfbe_town_neighbors", [Shukurkalay, Khushab, Sakhee, FeeruzAbad]];
				Sakhee setVariable ["wfbe_town_neighbors", [Jilavur, ChakChak, FeeruzAbad, Kakaru]];
				Kakaru setVariable ["wfbe_town_neighbors", [Sakhee, Anar, FeeruzAbad]];
				FeeruzAbad setVariable ["wfbe_town_neighbors", [Jilavur, Anar, Kakaru, Falar, Sakhee]];
				Anar setVariable ["wfbe_town_neighbors", [FeeruzAbad, Kakaru, Timurkalay, Falar]];
				Falar setVariable ["wfbe_town_neighbors", [FeeruzAbad, Anar, Bastam]];
			};
			case 2: {//--- Medium.
				Garmarud setVariable ["wfbe_town_neighbors", [Imarat]];
				Imarat setVariable ["wfbe_town_neighbors", [Garmarud, Bastam]];
				Bastam setVariable ["wfbe_town_neighbors", [Imarat, Falar, Rasman, Gospandi]];
				Rasman setVariable ["wfbe_town_neighbors", [Shamali, Bastam]];
				Shamali setVariable ["wfbe_town_neighbors", [Rasman, Nagara]];
				Nagara setVariable ["wfbe_town_neighbors", [Gospandi, Shamali]];
				Gospandi setVariable ["wfbe_town_neighbors", [Nagara, Bastam, Mulladoost]];
				Mulladoost setVariable ["wfbe_town_neighbors", [Gospandi, Khushab]];
				Khushab setVariable ["wfbe_town_neighbors", [Mulladoost]];
				Falar setVariable ["wfbe_town_neighbors", [Anar, Bastam]];
			};
			case 1: {//--- Small.
				Bastam setVariable ["wfbe_town_neighbors", [Imarat, Falar, Rasman, Gospandi]];
				Rasman setVariable ["wfbe_town_neighbors", [Shamali, Bastam]];
				Shamali setVariable ["wfbe_town_neighbors", [Rasman, Nagara]];
				Nagara setVariable ["wfbe_town_neighbors", [Gospandi, Shamali]];
				Nur setVariable ["wfbe_town_neighbors", [Nagara]];
				Gospandi setVariable ["wfbe_town_neighbors", [Nagara, Bastam, Mulladoost]];
			};
			case 0: {//--- Extra Small.
				Huzrutimam setVariable ["wfbe_town_neighbors", [LoyManara]];
				LoyManara setVariable ["wfbe_town_neighbors", [Chardarakht, Huzrutimam]];
				Chardarakht setVariable ["wfbe_town_neighbors", [LoyManara]];
			};
		};
	};
	case "zargabad": {
		Qeslaq setVariable ["wfbe_town_neighbors", [Shahbaz, Zargabad]];
		Shahbaz setVariable ["wfbe_town_neighbors", [Qeslaq, Yarum]];
		Yarum setVariable ["wfbe_town_neighbors", [Zargabad, Shahbaz]];
		Zargabad setVariable ["wfbe_town_neighbors", [Qeslaq, Yarum, Nango, Azizajt, HazarBagh]];
		Azizajt setVariable ["wfbe_town_neighbors", [Zargabad, Nango]];
		Nango setVariable ["wfbe_town_neighbors", [Zargabad, Azizajt, HazarBagh]];
		HazarBagh setVariable ["wfbe_town_neighbors", [Zargabad, Nango]];
	};
	default {
		//--- Not found, prevent territorial mode from going on and swap back to standard mode.
		missionNamespace setVariable ['WFBE_C_TOWNS_CONQUEST_MODE', 0];
	};
};