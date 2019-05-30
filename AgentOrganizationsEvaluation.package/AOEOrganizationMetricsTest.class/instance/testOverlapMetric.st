testing
testOverlapMetric
	self assert: self grossi overlapOfPowerOverCoordination equals: 5 / 9.
	self
		assert: self grossi overlapOfControlOverCoordination
		equals: 2 / 9.
	self
		assert: self grossi overlapOfCoordinationOverControl
		equals: 2 / 5.
	self assert: self grossi overlapOfPowerOverControl equals: 2 / 5.
	self assert: self grossi overlapOfControlOverPower equals: 2 / 5.
	self assert: self grossi overlapOfCoordinationOverPower equals: 1.
	self
		assert: self tsunamiResponse overlapOfPowerOverCoordination
		equals: 2 / 25.
	self
		assert: self tsunamiResponse overlapOfControlOverCoordination
		equals: 1 / 5.
	self
		assert: self tsunamiResponse overlapOfCoordinationOverControl
		equals: 1.
	self
		assert: self tsunamiResponse overlapOfPowerOverControl
		equals: 2 / 5.
	self assert: self tsunamiResponse overlapOfControlOverPower equals: 1.
	self
		assert: self tsunamiResponse overlapOfCoordinationOverPower
		equals: 1