counting-power
numberOfPowerSIM
	"Count the number of symmetric links in power relations - for unilaterality metric"
	
	| number |
	
	number := 0.
	
	self powerRoles do: [ :aRole | 
		(aRole powerRelations size > 0) ifTrue: [
			aRole powerRelations do: [ :aCPRole |
				(aCPRole powerRelations includes: aRole) ifTrue: [ number := number + 1 ]
			]
		]
	].
	
	^ number