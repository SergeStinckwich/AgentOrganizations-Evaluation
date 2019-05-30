testing
testInCoverMetric
	self assert: self grossi incoverOfPowerOverCoordination equals: 1.
	self assert: self grossi incoverOfPowerOverControl equals: 1.
	self assert: self grossi incoverOfCoordinationOverPower equals: 5 / 8.
	self
		assert: self grossi incoverOfCoordinationOverControl
		equals: 5 / 8.
	self assert: self grossi incoverOfControlOverPower equals: 1.
	self assert: self grossi incoverOfControlOverCoordination equals: 1.
	self
		assert: self tsunamiResponse incoverOfPowerOverCoordination
		equals: 0.
	self
		assert: self tsunamiResponse incoverOfPowerOverControl
		equals: 1 / 2.
	self
		assert: self tsunamiResponse incoverOfCoordinationOverPower
		equals: 0.
	self
		assert: self tsunamiResponse incoverOfCoordinationOverControl
		equals: 0.
	self assert: self tsunamiResponse incoverOfControlOverPower equals: 1.
	self
		assert: self tsunamiResponse incoverOfControlOverCoordination
		equals: 0