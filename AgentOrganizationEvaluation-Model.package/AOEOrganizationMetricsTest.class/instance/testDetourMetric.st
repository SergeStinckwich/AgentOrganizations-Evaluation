testing
testDetourMetric
	self assert: self grossi detourOfPowerOverCoordination equals: 5 / 9.
	self assert: self grossi detourOfPowerOverControl equals: 2 / 5.
	self assert: self grossi detourOfCoordinationOverPower equals: 1.
	self
		assert: self grossi detourOfCoordinationOverControl
		equals: 2 / 5.
	self assert: self grossi detourOfControlOverPower equals: 2 / 5.
	self
		assert: self grossi detourOfControlOverCoordination
		equals: 2 / 9.
	self
		assert: self tsunamiResponse detourOfPowerOverCoordination
		equals: 2 / 25.
	self
		assert: self tsunamiResponse detourOfPowerOverControl
		equals: 2 / 5.
	self
		assert: self tsunamiResponse detourOfCoordinationOverPower
		equals: 1.
	self
		assert: self tsunamiResponse detourOfCoordinationOverControl
		equals: 1.
	self assert: self tsunamiResponse detourOfControlOverPower equals: 1.
	self
		assert: self tsunamiResponse detourOfControlOverCoordination
		equals: 1 / 5