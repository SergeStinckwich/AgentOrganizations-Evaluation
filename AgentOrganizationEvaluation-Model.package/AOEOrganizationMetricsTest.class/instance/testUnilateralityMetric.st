testing
testUnilateralityMetric
	self assert: self grossi unilateralityOfPowerStructure = 1.
	self assert: self grossi unilateralityOfCoordinationStructure = (1/3).
	self assert: self grossi unilateralityOfControlStructure = 1.
	
	self assert: self tsunamiResponse unilateralityOfPowerStructure = 1.
	self assert: self tsunamiResponse unilateralityOfCoordinationStructure = (1/25).
	self assert: self tsunamiResponse unilateralityOfControlStructure = 1
	