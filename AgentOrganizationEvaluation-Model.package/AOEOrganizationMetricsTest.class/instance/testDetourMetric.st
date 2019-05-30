testing
testDetourMetric
	self assert: self grossi detourOfPowerOverCoordination = (5/9).
	self assert: self grossi detourOfPowerOverControl = (2/5).
	self assert: self grossi detourOfCoordinationOverPower = 1.
	self assert: self grossi detourOfCoordinationOverControl = (2/5).
	self assert: self grossi detourOfControlOverPower = (2/5).
	self assert: self grossi detourOfControlOverCoordination = (2/9).
	
	self assert: self tsunamiResponse detourOfPowerOverCoordination = (2/25).
	self assert: self tsunamiResponse detourOfPowerOverControl= (2/5).
	self assert: self tsunamiResponse detourOfCoordinationOverPower = 1.	
	self assert: self tsunamiResponse detourOfCoordinationOverControl = 1.
	self assert: self tsunamiResponse detourOfControlOverPower = 1.
	self assert: self tsunamiResponse detourOfControlOverCoordination = (1/5)
	