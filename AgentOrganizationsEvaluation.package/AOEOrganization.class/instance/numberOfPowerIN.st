counting-power
numberOfPowerIN
	"Count the number of node which has the indegree <= 1 in power relations - for univocity, incover, chain metrics"
	| number |
		
	number := 0.
	
	self powerRoles do: [ :aRole |						
		( (self dictionaryOfPowerIndegree at: aRole) < 2 ) ifTrue: [ number := number + 1 ].
	].	
	
	^ number.