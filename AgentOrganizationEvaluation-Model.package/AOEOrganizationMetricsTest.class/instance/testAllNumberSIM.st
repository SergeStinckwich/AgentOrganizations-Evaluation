testing
testAllNumberSIM	
	self assert: self tsunamiResponse numberOfPowerSIM = 0.
	self assert: self tsunamiResponse numberOfCoordinationSIM = 24.
	self assert: self tsunamiResponse numberOfControlSIM = 0