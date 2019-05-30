metrics-coordination
unilateralityOfCoordinationStructure
	| tmp |
	tmp := (self numberOfCoordinationSIM) / (self numberOfCoordinationRelations).
	^ 1 - tmp