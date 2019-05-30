counting-coordination
numberOfCoordinationCUT
	"Count the number of CUT collection in coordination relations - for flatness metric"
	
	| number |
	
	number := 0.
	
	self coordinationRoles do: [ :aRole | 
		(aRole numberOfCoordinationOutdegree > 0) ifTrue: [ "od_k(x) >= 1"
			((self dictionaryOfCoordinationIndegree at: aRole) > 0) ifTrue: [ "id_k(x) >= 1"
				number := number + 1
			]
		]
	].
	
	^ number