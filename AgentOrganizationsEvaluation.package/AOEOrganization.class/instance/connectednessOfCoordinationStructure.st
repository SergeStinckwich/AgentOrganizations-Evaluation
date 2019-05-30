metrics-coordination
connectednessOfCoordinationStructure
	| n |
	n := self numberOfCoordinationRoles.
	^ 1 - (self numberOfCoordinationDisconnectedPairs / (n * (n - 1)))