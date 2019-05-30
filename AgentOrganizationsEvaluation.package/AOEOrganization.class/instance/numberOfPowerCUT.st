counting-power
numberOfPowerCUT
	"Count the number of CUT collection in power relations - for flatness metric"
	
	| number |
	
	number := 0.
	
	self powerRoles do: [ :aRole | 
		(aRole numberOfPowerOutdegree > 0) ifTrue: [ "od_k(x) >= 1"
			((self dictionaryOfPowerIndegree at: aRole) > 0) ifTrue: [ "id_k(x) >= 1"
				number := number + 1
			]
		]
	].
	
	^ number