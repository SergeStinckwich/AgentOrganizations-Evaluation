testing
testNumberOfRoles
	self assert: self grossi roles size = 8.
	self assert: self grossi numberOfRoles = 8.
	self assert: self tsunamiResponse roles size = 7.
	self assert: self tsunamiResponse numberOfRoles = 7