testing
testUnilateralityMetric
	self assert: self grossi unilateralityOfPowerStructure equals: 1.
	self
		assert: self grossi unilateralityOfCoordinationStructure
		equals: 1 / 3.
	self assert: self grossi unilateralityOfControlStructure equals: 1.
	self
		assert: self tsunamiResponse unilateralityOfPowerStructure
		equals: 1.
	self
		assert: self tsunamiResponse unilateralityOfCoordinationStructure
		equals: 1 / 25.
	self
		assert: self tsunamiResponse unilateralityOfControlStructure
		equals: 1