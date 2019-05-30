metrics-control
chainOfControlOverPower
	"Count the number of Chain in control over power"
	| nbChainAbove nbChainBelow |
	
	nbChainBelow := self numberOfPowerOUT.
	
	nbChainAbove := 0.
	
	self controlRoles do: [ :aRole |						
		((self dictionaryOfControlIndegree at: aRole) < 2) ifTrue: [ 
			(self powerRoles includes: aRole) ifTrue: [ 
				((aRole numberOfPowerOutdegree) < 2) ifTrue: [ 
					nbChainAbove := nbChainAbove + 1.
				]
			]			
		]
	].	
				
	Transcript show: ('Above : ', nbChainAbove asString, ' Below : ', nbChainBelow asString); cr.
	nbChainBelow = 0 ifTrue:[ nbChainBelow := 1].
	^ (nbChainAbove / nbChainBelow).