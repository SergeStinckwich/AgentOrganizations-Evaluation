metrics-coordination
chainOfCoordinationOverPower
	"Count the number of Chain in coordination over power"
	| nbChainAbove nbChainBelow |
	
	nbChainBelow := self numberOfPowerOUT.
	
	nbChainAbove := 0.
	
	self coordinationRoles do: [ :aRole |						
		((self dictionaryOfCoordinationIndegree at: aRole) < 2) ifTrue: [ 
			(self powerRoles includes: aRole) ifTrue: [ 
				((aRole numberOfPowerOutdegree) < 2) ifTrue: [ 
					nbChainAbove := nbChainAbove + 1.
				]
			]			
		]
	].	
				
	Transcript show: ('Above : ', nbChainAbove asString, ' Below : ', nbChainBelow asString); cr.
	
	^ (nbChainAbove / nbChainBelow).