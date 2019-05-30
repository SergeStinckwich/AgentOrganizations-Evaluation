testing
testCompletenessMetric

	self assert: self grossi completenessOfPowerStructure = (5 / 56).
	self assert: self grossi completenessOfControlStructure = (5 / 56).
	self assert: self grossi completenessOfCoordinationStructure = (9 / 56).
	
	self assert: self tsunamiResponse completenessOfPowerStructure = (1 / 3).	
	self assert: self tsunamiResponse completenessOfControlStructure = (1 / 6).		
	self assert: self tsunamiResponse completenessOfCoordinationStructure = (25 / 42)