metrics-power
completenessOfPowerStructure
	| n div|
	n := self numberOfPowerRoles.
	div := (n * (n - 1)).
	div = 0 ifTrue:[ div := 1].
	^ self numberOfPowerRelations / div.