counting-coordination
numberOfCoordinationOUT
	"Count the number of node which has the outdegree <= 1 in coordination relations - for univocity, outcover, chain metrics"
	| number |
		
	number := 0.
	
	self coordinationRoles do: [ :aRole |						
		( (aRole numberOfCoordinationOutdegree) < 2 ) ifTrue: [ number := number + 1 ].
	].	
	
	^ number.