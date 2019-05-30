testing
testConnectednessMetric
	self assert: self grossi connectednessOfPowerStructure equals: 1 / 4.
	self
		assert: self grossi connectednessOfControlStructure
		equals: 1 / 4.
	self
		assert: self grossi connectednessOfCoordinationStructure
		equals: 1 / 4.
	self
		assert: self tsunamiResponse connectednessOfPowerStructure
		equals: 1.
	self
		assert: self tsunamiResponse connectednessOfControlStructure
		equals: 1.
	self
		assert: self tsunamiResponse connectednessOfCoordinationStructure
		equals: 1