testing
testConnectednessMetric
	self assert: self grossi connectednessOfPowerStructure = (1 / 4).
	self assert: self grossi connectednessOfControlStructure = (1 / 4).
	self assert: self grossi connectednessOfCoordinationStructure = (1 / 4).
	
	self assert: self tsunamiResponse connectednessOfPowerStructure = 1.
	self assert: self tsunamiResponse connectednessOfControlStructure = 1.
	self assert: self tsunamiResponse connectednessOfCoordinationStructure = 1