counting
numberOfControlOutdegree
	"Count the outdegree of each node in control relations"
	
	| number |
	number := 0.
	self controlRelations do: [ :aRole | number := number + 1 ].
	^ number

