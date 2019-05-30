metrics-control
completenessOfControlStructure
	| n |
	n := self numberOfControlRoles.
	^ self numberOfControlRelations / (n * (n - 1))