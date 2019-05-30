metrics-control
chainOfControlOverCoordination
	"Count the number of Chain in control over coordination"
	| nbChainAbove nbChainBelow |
	
	nbChainBelow := self numberOfCoordinationOUT.
	
	nbChainAbove := 0.
	
	self controlRoles do: [ :aRole |						
		((self dictionaryOfControlIndegree at: aRole) < 2) ifTrue: [ 
			(self coordinationRoles includes: aRole) ifTrue: [ 
				((aRole numberOfCoordinationOutdegree) < 2) ifTrue: [ 
					nbChainAbove := nbChainAbove + 1.
				]
			]			
		]
	].	
				
	Transcript show: ('Above : ', nbChainAbove asString, ' Below : ', nbChainBelow asString); cr.
	
	^ (nbChainAbove / nbChainBelow).