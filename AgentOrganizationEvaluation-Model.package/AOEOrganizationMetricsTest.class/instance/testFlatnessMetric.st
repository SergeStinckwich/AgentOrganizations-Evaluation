testing
testFlatnessMetric
	self assert: self grossi flatnessOfPowerStructure = 1.
	self assert: self grossi flatnessOfCoordinationStructure = (5/8).
	self assert: self grossi flatnessOfControlStructure = 1.
	
	self assert: self tsunamiResponse flatnessOfPowerStructure = 1.
	self assert: self tsunamiResponse flatnessOfCoordinationStructure = (1/7).
	self assert: self tsunamiResponse flatnessOfControlStructure = 1
	
