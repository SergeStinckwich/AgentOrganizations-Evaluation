testing
testOverlapMetric
	self assert: self grossi overlapOfPowerOverCoordination = (5/9).
	self assert: self grossi overlapOfControlOverCoordination = (2/9).
	self assert: self grossi overlapOfCoordinationOverControl = (2/5).
	self assert: self grossi overlapOfPowerOverControl = (2/5).
	self assert: self grossi overlapOfControlOverPower = (2/5).
	self assert: self grossi overlapOfCoordinationOverPower = 1.	
		
	
	self assert: self tsunamiResponse overlapOfPowerOverCoordination = (2/25).
	self assert: self tsunamiResponse overlapOfControlOverCoordination = (1/5).
	self assert: self tsunamiResponse overlapOfCoordinationOverControl = 1.
	self assert: self tsunamiResponse overlapOfPowerOverControl= (2/5).
	self assert: self tsunamiResponse overlapOfControlOverPower = 1.
	self assert: self tsunamiResponse overlapOfCoordinationOverPower = 1	
	
	
	