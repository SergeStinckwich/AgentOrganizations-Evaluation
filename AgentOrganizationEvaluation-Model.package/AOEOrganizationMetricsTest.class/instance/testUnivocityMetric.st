testing
testUnivocityMetric
	self assert: self grossi univocityOfPowerStructure equals: 1.
	self
		assert: self grossi univocityOfCoordinationStructure
		equals: 5 / 8.
	self assert: self grossi univocityOfControlStructure equals: 1.
	self assert: self tsunamiResponse univocityOfPowerStructure equals: 1.
	self
		assert: self tsunamiResponse univocityOfCoordinationStructure
		equals: 1 / 7.
	self
		assert: self tsunamiResponse univocityOfControlStructure
		equals: 1