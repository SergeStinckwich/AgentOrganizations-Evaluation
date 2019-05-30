metrics-power
chainOfPowerOverControl
	"Count the number of Chain in power over control"
	| nbChainAbove nbChainBelow |
	
	nbChainBelow := self numberOfControlOUT.
	
	nbChainAbove := 0.
	
	self powerRoles do: [ :aRole |						
		((self dictionaryOfPowerIndegree at: aRole) < 2) ifTrue: [ 
			(self controlRoles includes: aRole) ifTrue: [ 
				((aRole numberOfControlOutdegree) < 2) ifTrue: [ 
					nbChainAbove := nbChainAbove + 1.
				]
			]			
		]
	].	
				
	Transcript show: ('Above : ', nbChainAbove asString, ' Below : ', nbChainBelow asString); cr.
	
	^ (nbChainAbove / nbChainBelow).