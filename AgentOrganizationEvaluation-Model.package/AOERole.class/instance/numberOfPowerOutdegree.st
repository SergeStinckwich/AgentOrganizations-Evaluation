counting
numberOfPowerOutdegree
	"Count the outdegree of each node in power relations"
	
	| number |	
	number := 0.
	self powerRelations do: [ :aRole | number := number + 1 ].		
	^ number

