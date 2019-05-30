counting-control
numberOfControlSIM	
	"Count the number of symmetric links in control relations - for unilaterality metric"
	
	| number |
	
	number := 0.
	
	self controlRoles do: [ :aRole | 
		(aRole controlRelations size > 0) ifTrue: [
			aRole controlRelations do: [ :aCPRole |
				(aCPRole controlRelations includes: aRole) ifTrue: [ number := number + 1 ]
			]
		]
	].
	
	^ number