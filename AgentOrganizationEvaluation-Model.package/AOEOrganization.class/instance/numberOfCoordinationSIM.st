counting-coordination
numberOfCoordinationSIM
	
	"Count the number of symmetric links in coordination relations - for unilaterality metric"
	
	| number |
	
	number := 0.
	
	self coordinationRoles do: [ :aRole | 
		(aRole coordinationRelations size > 0) ifTrue: [
			aRole coordinationRelations do: [ :aCPRole |
				(aCPRole coordinationRelations includes: aRole) ifTrue: [ number := number + 1 ]
			]
		]
	].
	
	^ number