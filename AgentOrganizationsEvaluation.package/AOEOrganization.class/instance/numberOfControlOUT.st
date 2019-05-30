counting-control
numberOfControlOUT
	"Count the number of node which has the outdegree <= 1 in control relations - for univocity, outcover, chain metrics"
	| number |
		
	number := 0.
	
	self controlRoles do: [ :aRole |						
		( (aRole numberOfControlOutdegree) < 2 ) ifTrue: [ number := number + 1 ].
	].	
	
	^ number.