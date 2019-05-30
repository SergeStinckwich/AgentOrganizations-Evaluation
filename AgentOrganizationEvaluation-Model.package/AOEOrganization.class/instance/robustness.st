criteria
robustness
	"Measure of how stable in face of anticipated risks."
	| var |
	
	var := (self completenessOfCoordinationStructure - rbnGoodComplCoord) squared.
	var := var + ((self connectednessOfCoordinationStructure - rbnGoodConnCoord) squared).
	var := var + ((self univocityOfPowerStructure  - rbnGoodUnivPow) squared).
	var := var + ((self unilateralityOfCoordinationStructure - rbnGoodUnilCoord) squared).
	var := var + ((self univocityOfControlStructure - rbnGoodUnivContr) squared).
	var := var + ((self flatnessOfControlStructure - rbnGoodFlatContr) squared).
	var := var + ((self overlapOfCoordinationOverPower - rbnGoodOverlapCoordPow) squared).
	var := var + ((self chainOfControlOverPower - rbnGoodChainContrPow) squared).
	var := var + ((self chainOfControlOverCoordination - rbnGoodChainContrCoord) squared).
	var := var + ((self incoverOfControlOverCoordination - rbnGoodInCoverContrCoord) squared).
	var := var + ((self outcoverOfPowerOverControl - rbnGoodOutCoverPowContr) squared).
	var := var + ((self outcoverOfPowerOverCoordination - rbnGoodOutCoverPowCoord) squared).
	
	Transcript show: ('Robustness : ', var asString); cr.
	
	^ (var / 12).


