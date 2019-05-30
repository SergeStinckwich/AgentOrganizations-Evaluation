counting-control
numberOfControlCUT
	"Count the number of CUT collection in control relations - for flatness metric"
	
	| number |
	
	number := 0.
	
	self controlRoles do: [ :aRole | 
		(aRole numberOfControlOutdegree > 0) ifTrue: [ "od_k(x) >= 1"
			((self dictionaryOfControlIndegree at: aRole) > 0) ifTrue: [ "id_k(x) >= 1"
				number := number + 1
			]
		]
	].
	
	^ number