metrics-control
connectednessOfControlStructure
	| n |
	n := self numberOfControlRoles.
	^ 1 - (self numberOfControlDisconnectedPairs / (n * (n - 1)))