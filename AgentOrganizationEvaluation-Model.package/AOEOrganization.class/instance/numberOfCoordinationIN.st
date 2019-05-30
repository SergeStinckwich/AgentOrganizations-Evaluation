counting-coordination
numberOfCoordinationIN
	"Count the number of node which has the indegree <= 1 in coordination relations - for univocity, incover, chain metrics"
	| number |
		
	number := 0.
	
	self coordinationRoles do: [ :aRole |		
		( (self dictionaryOfCoordinationIndegree at: aRole) < 2 ) ifTrue: [ number := number + 1 ].
	].	
	
	^ number.