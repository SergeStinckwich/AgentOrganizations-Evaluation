metrics-power
chainOfPowerOverCoordination
	"Count the number of Chain in power over coordination"
	| nbChainAbove nbChainBelow |
	
	nbChainBelow := self numberOfCoordinationOUT.
	
	nbChainAbove := 0.
	
	self powerRoles do: [ :aRole |						
		((self dictionaryOfPowerIndegree at: aRole) < 2) ifTrue: [ 
			(self coordinationRoles includes: aRole) ifTrue: [ 
				((aRole numberOfCoordinationOutdegree) < 2) ifTrue: [ 
					nbChainAbove := nbChainAbove + 1.
				]
			]			
		]
	].	
				
	Transcript show: ('Above : ', nbChainAbove asString, ' Below : ', nbChainBelow asString); cr.
	
	^ (nbChainAbove / nbChainBelow).