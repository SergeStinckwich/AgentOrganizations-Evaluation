testing
testChainMetric
	self assert: self grossi chainOfPowerOverCoordination equals: 1.
	self assert: self grossi chainOfPowerOverControl equals: 1.
	self
		assert: self tsunamiResponse chainOfPowerOverCoordination
		equals: 0.
	self
		assert: self tsunamiResponse chainOfPowerOverControl
		equals: 2 / 5.
	self
		assert: self tsunamiResponse chainOfCoordinationOverPower
		equals: 0.
	self
		assert: self tsunamiResponse chainOfCoordinationOverControl
		equals: 0.
	self assert: self tsunamiResponse chainOfControlOverPower equals: 1.
	self
		assert: self tsunamiResponse chainOfControlOverCoordination
		equals: 0