counting
numberOfCoordinationOutdegree
	"Count the outdegree of each node in coordination relations"
	
	| number |	
	
	number := 0.
	self coordinationRelations do: [ :aRole | number := number + 1 ].		
	^ number

