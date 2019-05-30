testing
testAllNumberCUT
	self assert: self tsunamiResponse numberOfPowerCUT equals: 0.
	self assert: self tsunamiResponse numberOfCoordinationCUT equals: 6.
	self assert: self tsunamiResponse numberOfControlCUT equals: 0