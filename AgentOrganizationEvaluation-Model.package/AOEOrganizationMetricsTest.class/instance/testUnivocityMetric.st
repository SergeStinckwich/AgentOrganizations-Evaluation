testing
testUnivocityMetric
	self assert: self grossi univocityOfPowerStructure = 1.
	self assert: self grossi univocityOfCoordinationStructure = (5/8).
	self assert: self grossi univocityOfControlStructure = 1.
	
	self assert: self tsunamiResponse univocityOfPowerStructure = 1.
	self assert: self tsunamiResponse univocityOfCoordinationStructure = (1/7).
	self assert: self tsunamiResponse univocityOfControlStructure = 1
	
