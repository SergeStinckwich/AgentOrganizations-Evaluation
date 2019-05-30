testing
testAllNumberCUT	
	self assert: self tsunamiResponse numberOfPowerCUT = 0.
	self assert: self tsunamiResponse numberOfCoordinationCUT = 6.
	self assert: self tsunamiResponse numberOfControlCUT = 0.