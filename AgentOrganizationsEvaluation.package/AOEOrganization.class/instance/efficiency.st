criteria
efficiency
	"Mesure the amount of resources used by the organization to perform its tasks"
	| var |
	
	var := (self completenessOfPowerStructure - effGoodComplPow) squared.
	var := var + ((self economyOfPowerStructure - effGoodEconPow) squared).
	var := var + ((self economyOfCoordinationStructure - effGoodEconCoord) squared).
	var := var + ((self overlapOfCoordinationOverPower - effGoodOverlapCoordPow) squared).
	var := var + ((self overlapOfPowerOverCoordination - effGoodOverlapPowCoord) squared).
	var := var + ((self unilateralityOfPowerStructure - effGoodUnilPow) squared).	
	var := var + ((self univocityOfPowerStructure - effGoodUnivPow) squared).
	var := var + ((self economyOfControlStructure - effGoodEconContr) squared).
	var := var + ((self overlapOfControlOverPower - effGoodOverlapContrPow) squared).
	var := var + ((self overlapOfPowerOverControl - effGoodOverlapPowContr) squared).	
	
	Transcript show: ('Efficiency : ', var asString); cr.
	
	^ (var / 10).


