metrics-power
economyOfPowerStructure
	| m n tmp |
	m := self numberOfPowerRelations.
	n := self numberOfPowerRoles.	
	tmp := (m - (n - 1)) / (n * (n-1) - (n-1)).
	^ 1 - tmp