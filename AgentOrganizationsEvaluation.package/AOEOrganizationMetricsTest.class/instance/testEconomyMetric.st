testing
testEconomyMetric
	self assert: self grossi economyOfPowerStructure equals: 51 / 49.
	self assert: self grossi economyOfControlStructure equals: 51 / 49.
	self
		assert: self grossi economyOfCoordinationStructure
		equals: 47 / 49.
	self assert: self tsunamiResponse economyOfPowerStructure equals: 1.
	self assert: self tsunamiResponse economyOfControlStructure equals: 1.
	self
		assert: self tsunamiResponse economyOfCoordinationStructure
		equals: 17 / 36