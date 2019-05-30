testing
testAllNumberDisconnectedPairs
	self assert: self grossi numberOfPowerDisconnectedPairs equals: 42.
	self assert: self grossi numberOfControlDisconnectedPairs equals: 42.
	self
		assert: self grossi numberOfCoordinationDisconnectedPairs
		equals: 42.
	self
		assert: self tsunamiResponse numberOfPowerDisconnectedPairs
		equals: 0.
	self
		assert: self tsunamiResponse numberOfControlDisconnectedPairs
		equals: 0.
	self
		assert: self tsunamiResponse numberOfCoordinationDisconnectedPairs
		equals: 0