testing
testFlatnessMetric
	self assert: self grossi flatnessOfPowerStructure equals: 1.
	self
		assert: self grossi flatnessOfCoordinationStructure
		equals: 5 / 8.
	self assert: self grossi flatnessOfControlStructure equals: 1.
	self assert: self tsunamiResponse flatnessOfPowerStructure equals: 1.
	self
		assert: self tsunamiResponse flatnessOfCoordinationStructure
		equals: 1 / 7.
	self
		assert: self tsunamiResponse flatnessOfControlStructure
		equals: 1