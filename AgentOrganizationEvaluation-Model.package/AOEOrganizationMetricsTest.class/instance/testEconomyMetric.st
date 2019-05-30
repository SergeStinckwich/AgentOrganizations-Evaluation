testing
testEconomyMetric
	self assert: self grossi economyOfPowerStructure = (51/49).
	self assert: self grossi economyOfControlStructure = (51/49).
	self assert: self grossi economyOfCoordinationStructure = (47/49).
	
	self assert: self tsunamiResponse economyOfPowerStructure = 1.
	self assert: self tsunamiResponse economyOfControlStructure = 1.
	self assert: self tsunamiResponse economyOfCoordinationStructure = (17/36)