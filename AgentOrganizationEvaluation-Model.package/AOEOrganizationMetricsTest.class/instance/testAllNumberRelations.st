testing
testAllNumberRelations
	
	self assert: self grossi numberOfPowerRelations = 5.
	self assert: self grossi numberOfControlRelations = 5.
	self assert: self grossi numberOfCoordinationRelations = 9.
	self assert: self tsunamiResponse numberOfPowerRelations = 2.
	self assert: self tsunamiResponse numberOfControlRelations = 5.		
	self assert: self tsunamiResponse numberOfCoordinationRelations = 25