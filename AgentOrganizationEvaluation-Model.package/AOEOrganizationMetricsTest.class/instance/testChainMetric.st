testing
testChainMetric
	self assert: self grossi chainOfPowerOverCoordination = 1.
	self assert: self grossi chainOfPowerOverControl = 1.
	"self assert: self grossi chainOfCoordinationOverPower = (5/8).
	self assert: self grossi chainOfCoordinationOverControl = (5/8).
	self assert: self grossi chainOfControlOverPower = 1.
	self assert: self grossi chainOfControlOverCoordination = 1."
	
	self assert: self tsunamiResponse chainOfPowerOverCoordination = 0.
	self assert: self tsunamiResponse chainOfPowerOverControl= (2/5).
	self assert: self tsunamiResponse chainOfCoordinationOverPower = 0.	
	self assert: self tsunamiResponse chainOfCoordinationOverControl = 0.
	self assert: self tsunamiResponse chainOfControlOverPower = 1.
	self assert: self tsunamiResponse chainOfControlOverCoordination = 0