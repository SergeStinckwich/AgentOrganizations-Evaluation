metrics-coordination
completenessOfCoordinationStructure
	| n val|
	n := self numberOfCoordinationRoles.
	val := (n * (n - 1)).
	val = 0 ifTrue:[ val := 1].
	^ self numberOfCoordinationRelations / val.