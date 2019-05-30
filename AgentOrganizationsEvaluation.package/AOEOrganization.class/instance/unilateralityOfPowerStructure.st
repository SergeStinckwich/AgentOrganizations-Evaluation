metrics-power
unilateralityOfPowerStructure
	| tmp val|
	val := (self numberOfPowerRelations).
	val = 0 ifTrue:[ val := 1].
	tmp := (self numberOfPowerSIM) / val.
	^ 1 - tmp