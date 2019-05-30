testing
testAllNumberIN
	self assert: self tsunamiResponse numberOfPowerIN equals: 3.
	self assert: self tsunamiResponse numberOfCoordinationIN equals: 1.
	self assert: self tsunamiResponse numberOfControlIN equals: 6