counting-power
numberOfPowerOUT
	"Count the number of node which has the outdegree <= 1 in power relations - for univocity, outcover, chain metrics"
	| number |
		
	number := 0.
	
	self powerRoles do: [ :aRole |						
		( (aRole numberOfPowerOutdegree) < 2 ) ifTrue: [ number := number + 1 ].
	].	
	
	^ number.