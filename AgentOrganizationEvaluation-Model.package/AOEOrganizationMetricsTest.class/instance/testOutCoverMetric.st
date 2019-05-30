testing
testOutCoverMetric
	self assert: self grossi outcoverOfPowerOverCoordination = 1.
	self assert: self grossi outcoverOfPowerOverControl = (5/6).
	"self assert: self grossi outcoverOfCoordinationOverPower = (5/8).
	self assert: self grossi outcoverOfCoordinationOverControl = (5/8).
	self assert: self grossi outcoverOfControlOverPower = 1.
	self assert: self grossi outcoverOfControlOverCoordination = 1."
	
	self assert: self tsunamiResponse outcoverOfPowerOverCoordination = 0.
	self assert: self tsunamiResponse outcoverOfPowerOverControl= (2/5).
	self assert: self tsunamiResponse outcoverOfCoordinationOverPower = 0.	
	self assert: self tsunamiResponse outcoverOfCoordinationOverControl = 0.
	self assert: self tsunamiResponse outcoverOfControlOverPower = 1.
	self assert: self tsunamiResponse outcoverOfControlOverCoordination = 0