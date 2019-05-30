metrics-power
univocityOfPowerStructure
	|numberOfPowerIN numberOfPowerRoles|
	
	numberOfPowerIN :=  (self numberOfPowerIN).
	numberOfPowerRoles := (self numberOfPowerRoles).
	numberOfPowerRoles = 0 ifTrue:[ numberOfPowerRoles := 1].
	^  numberOfPowerIN / numberOfPowerRoles.