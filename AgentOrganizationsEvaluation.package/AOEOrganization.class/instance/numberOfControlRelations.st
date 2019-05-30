counting-control
numberOfControlRelations
	^ self roles sum: [ :each | each controlRelations size ]