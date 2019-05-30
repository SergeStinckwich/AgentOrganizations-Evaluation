testing
testAllNumberRelations
	self assert: self grossi numberOfPowerRelations equals: 5.
	self assert: self grossi numberOfControlRelations equals: 5.
	self assert: self grossi numberOfCoordinationRelations equals: 9.
	self assert: self tsunamiResponse numberOfPowerRelations equals: 2.
	self assert: self tsunamiResponse numberOfControlRelations equals: 5.
	self
		assert: self tsunamiResponse numberOfCoordinationRelations
		equals: 25