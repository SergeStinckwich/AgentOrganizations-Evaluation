testing
testAllNumberDisconnectedPairs
	self assert: self grossi numberOfPowerDisconnectedPairs = 42.		
	self assert: self grossi numberOfControlDisconnectedPairs = 42.
	self assert: self grossi numberOfCoordinationDisconnectedPairs = 42.
	
	self assert: self tsunamiResponse numberOfPowerDisconnectedPairs = 0.
	self assert: self tsunamiResponse numberOfControlDisconnectedPairs = 0.		
	self assert: self tsunamiResponse numberOfCoordinationDisconnectedPairs = 0.