metrics-control
economyOfControlStructure
	| m n tmp |
	m := self numberOfControlRelations.
	n := self numberOfControlRoles.	
	tmp := (m - (n - 1)) / (n * (n-1) - (n-1)).
	^ 1 - tmp