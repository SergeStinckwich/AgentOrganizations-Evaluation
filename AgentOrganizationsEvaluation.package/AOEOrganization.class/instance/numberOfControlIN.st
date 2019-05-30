counting-control
numberOfControlIN
	"Count the number of node which has the indegree <= 1 in control relations - for univocity, incover, chain metrics"
	| number |
		
	number := 0.
	
	self controlRoles do: [ :aRole |		
		( (self dictionaryOfControlIndegree at: aRole) < 2 ) ifTrue: [ number := number + 1 ].
	].	
	
	^ number.