testing
testOutCoverMetric
	self assert: self grossi outcoverOfPowerOverCoordination equals: 1.
	self assert: self grossi outcoverOfPowerOverControl equals: 5 / 6.
	self
		assert: self tsunamiResponse outcoverOfPowerOverCoordination
		equals: 0.
	self
		assert: self tsunamiResponse outcoverOfPowerOverControl
		equals: 2 / 5.
	self
		assert: self tsunamiResponse outcoverOfCoordinationOverPower
		equals: 0.
	self
		assert: self tsunamiResponse outcoverOfCoordinationOverControl
		equals: 0.
	self
		assert: self tsunamiResponse outcoverOfControlOverPower
		equals: 1.
	self
		assert: self tsunamiResponse outcoverOfControlOverCoordination
		equals: 0