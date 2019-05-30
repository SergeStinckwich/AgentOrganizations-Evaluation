testing
testInCoverMetric
	self assert: self grossi incoverOfPowerOverCoordination = 1.
	self assert: self grossi incoverOfPowerOverControl = 1.
	self assert: self grossi incoverOfCoordinationOverPower = (5/8).
	self assert: self grossi incoverOfCoordinationOverControl = (5/8).
	self assert: self grossi incoverOfControlOverPower = 1.
	self assert: self grossi incoverOfControlOverCoordination = 1.
	
	self assert: self tsunamiResponse incoverOfPowerOverCoordination = 0.
	self assert: self tsunamiResponse incoverOfPowerOverControl= (1/2).
	self assert: self tsunamiResponse incoverOfCoordinationOverPower = 0.	
	self assert: self tsunamiResponse incoverOfCoordinationOverControl = 0.
	self assert: self tsunamiResponse incoverOfControlOverPower = 1.
	self assert: self tsunamiResponse incoverOfControlOverCoordination = 0