initialization
initialize
	roles := OrderedCollection new.
	
	"robustness criteria"
	rbnGoodComplCoord := 1.
	rbnGoodConnCoord := 1.
	rbnGoodUnivPow := 0.
	rbnGoodUnilCoord := 0.
	rbnGoodUnivContr := 0.
	rbnGoodFlatContr := 0.
	rbnGoodOverlapCoordPow := 1.
	rbnGoodChainContrPow := 1.
	rbnGoodChainContrCoord := 1.
	rbnGoodInCoverContrCoord := 1.
	rbnGoodOutCoverPowContr := 1.
	rbnGoodOutCoverPowCoord := 1.
	
	"flexibility criteria"
	lfxGoodComplPow := 0.
	lfxGoodComplCoord := 1.
	lfxGoodConnPow := 0.
	lfxGoodConnCoord := 1.
	lfxGoodChainContrPow := 1.
	lfxGoodOutCoverPowContr := 1.
	
	"efficiency criteria"
	effGoodComplPow := 1. 
	effGoodEconPow := 1.
	effGoodEconCoord := 1.
	effGoodOverlapCoordPow := 1. 
	effGoodOverlapPowCoord := 1.
	effGoodUnilPow := 1.
	effGoodUnivPow := 1.
	effGoodEconContr := 1.
	effGoodOverlapContrPow := 1. 
	effGoodOverlapPowContr := 1.
		
	