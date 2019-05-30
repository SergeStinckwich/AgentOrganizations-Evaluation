metrics-coordination
chainOfCoordinationOverControl
	"Count the number of Chain in coordination over control"
	| nbChainAbove nbChainBelow |
	
	nbChainBelow := self numberOfControlOUT.
	
	nbChainAbove := 0.
	
	self coordinationRoles do: [ :aRole |						
		((self dictionaryOfCoordinationIndegree at: aRole) < 2) ifTrue: [ 
			(self controlRoles includes: aRole) ifTrue: [ 
				((aRole numberOfControlOutdegree) < 2) ifTrue: [ 
					nbChainAbove := nbChainAbove + 1.
				]
			]			
		]
	].	
				
	Transcript show: ('Above : ', nbChainAbove asString, ' Below : ', nbChainBelow asString); cr.
	
	^ (nbChainAbove / nbChainBelow).