testing
testNumberOfRoles
	self assert: self grossi roles size equals: 8.
	self assert: self grossi numberOfRoles equals: 8.
	self assert: self tsunamiResponse roles size equals: 7.
	self assert: self tsunamiResponse numberOfRoles equals: 7