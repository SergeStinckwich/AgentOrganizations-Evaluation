testing
testCompletenessMetric
	self assert: self grossi completenessOfPowerStructure equals: 5 / 56.
	self
		assert: self grossi completenessOfControlStructure
		equals: 5 / 56.
	self
		assert: self grossi completenessOfCoordinationStructure
		equals: 9 / 56.
	self
		assert: self tsunamiResponse completenessOfPowerStructure
		equals: 1 / 3.
	self
		assert: self tsunamiResponse completenessOfControlStructure
		equals: 1 / 6.
	self
		assert: self tsunamiResponse completenessOfCoordinationStructure
		equals: 25 / 42