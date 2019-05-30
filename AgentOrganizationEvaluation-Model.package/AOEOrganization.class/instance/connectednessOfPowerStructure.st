metrics-power
connectednessOfPowerStructure
	| n val|
	n := self numberOfPowerRoles.
	val := (n * (n - 1)).
	val = 0 ifTrue:[ val := 1].
	^ 1 - (self numberOfPowerDisconnectedPairs / val).