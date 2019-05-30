counting-power
numberOfPathPowerOverCoordination
	"Count the number of PATHs links with power over coordination - for Detour and Overlap metric"
	
	| number |
	
	number := 0.
	
	self coordinationRoles do: [ :aRole | "x"
		(aRole coordinationRelations size > 0) ifTrue: [
			aRole powerRelations do: [ :aCPRole | "y"
				(aCPRole powerRelations includes: aRole) ifTrue: [ number := number + 1 ]
			]
		]
	].
	
	^ number