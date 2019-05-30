counting-coordination
numberOfCoordinationRelations
	^ self roles sum: [ :each | each coordinationRelations size ]