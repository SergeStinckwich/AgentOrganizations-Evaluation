metrics-coordination
economyOfCoordinationStructure
	| m n tmp |
	m := self numberOfCoordinationRelations.
	n := self numberOfCoordinationRoles.	
	tmp := (m - (n - 1)) / (n * (n-1) - (n-1)).
	^ 1 - tmp