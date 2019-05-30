metrics-coordination
incoverOfCoordinationOverPower
	"Count the number of InCover in coordination over power"
	| nbINAbove nbINBelow |
	
	nbINBelow := self numberOfPowerIN.
	
	nbINAbove := 0.
	
	self coordinationRoles do: [ :aRole |						
		((self dictionaryOfCoordinationIndegree at: aRole) < 2) ifTrue: [ 
			(self powerRoles includes: aRole) ifTrue: [ 
				((self dictionaryOfPowerIndegree at: aRole) < 2) ifTrue: [ 
					nbINAbove := nbINAbove + 1.
				]
			 ]			
		]
	].	
				
	Transcript show: ('Above : ', nbINAbove asString, ' Below : ', nbINBelow asString); cr.
	
	^ (nbINAbove / nbINBelow).