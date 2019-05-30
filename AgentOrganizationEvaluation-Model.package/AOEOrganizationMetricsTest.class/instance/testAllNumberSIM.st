testing
testAllNumberSIM
	self assert: self tsunamiResponse numberOfPowerSIM equals: 0.
	self assert: self tsunamiResponse numberOfCoordinationSIM equals: 24.
	self assert: self tsunamiResponse numberOfControlSIM equals: 0