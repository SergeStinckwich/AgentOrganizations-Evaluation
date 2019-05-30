metrics-control
incoverOfControlOverCoordination
	"Count the number of InCover in control over coordination"
	| nbINAbove nbINBelow |
	
	nbINBelow := self numberOfCoordinationIN.
	
	nbINAbove := 0.
	
	self controlRoles do: [ :aRole |						
		((self dictionaryOfControlIndegree at: aRole) < 2) ifTrue: [ 
			(self coordinationRoles includes: aRole) ifTrue: [ 
				((self dictionaryOfCoordinationIndegree at: aRole) < 2) ifTrue: [ 
					nbINAbove := nbINAbove + 1.
				]
			 ]			
		]
	].	
				
	Transcript show: ('Above : ', nbINAbove asString, ' Below : ', nbINBelow asString); cr.
	
	^ (nbINAbove / nbINBelow).