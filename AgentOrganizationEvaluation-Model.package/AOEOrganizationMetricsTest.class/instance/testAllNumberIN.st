testing
testAllNumberIN
	self assert: self tsunamiResponse numberOfPowerIN = 3.
	self assert: self tsunamiResponse numberOfCoordinationIN = 1.
	self assert: self tsunamiResponse numberOfControlIN = 6