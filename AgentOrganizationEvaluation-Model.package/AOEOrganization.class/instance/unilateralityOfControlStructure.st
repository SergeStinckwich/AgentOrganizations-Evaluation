metrics-control
unilateralityOfControlStructure
	| tmp |
	tmp := (self numberOfControlSIM) / (self numberOfControlRelations).
	^ 1 - tmp