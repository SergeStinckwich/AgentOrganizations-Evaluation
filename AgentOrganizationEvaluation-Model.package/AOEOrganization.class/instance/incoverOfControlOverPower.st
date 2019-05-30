metrics-control
incoverOfControlOverPower
	"Count the number of InCover in control over power"
	| nbINAbove nbINBelow |
	
	nbINBelow := self numberOfPowerIN.
	
	nbINAbove := 0.
	
	self controlRoles do: [ :aRole |						
		((self dictionaryOfControlIndegree at: aRole) < 2) ifTrue: [ 
			(self powerRoles includes: aRole) ifTrue: [ 
				((self dictionaryOfPowerIndegree at: aRole) < 2) ifTrue: [ 
					nbINAbove := nbINAbove + 1.
				]
			 ]			
		]
	].	
				
	Transcript show: ('Above : ', nbINAbove asString, ' Below : ', nbINBelow asString); cr.
	
	^ (nbINAbove / nbINBelow).