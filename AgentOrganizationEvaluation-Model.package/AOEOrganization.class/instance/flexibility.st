criteria
flexibility
	"Measure the looser cooperative association than classic hierarchical organizations."
	| var |
	
	var := (self completenessOfPowerStructure - lfxGoodComplPow) squared.
	var := var + ((self completenessOfCoordinationStructure - lfxGoodComplCoord) squared).
	var := var + ((self connectednessOfPowerStructure  - lfxGoodConnPow) squared).
	var := var + ((self connectednessOfCoordinationStructure - lfxGoodConnCoord) squared).
	var := var + ((self chainOfControlOverPower - lfxGoodChainContrPow) squared).
	var := var + ((self outcoverOfPowerOverControl - lfxGoodOutCoverPowContr) squared).	
	
	Transcript show: ('Flexibility : ', var asString); cr.
	
	^ (var / 6).


