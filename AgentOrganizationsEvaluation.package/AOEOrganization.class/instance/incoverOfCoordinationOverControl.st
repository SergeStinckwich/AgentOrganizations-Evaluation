metrics-coordination
incoverOfCoordinationOverControl
	"Count the number of InCover in coordination over control"
	| nbINAbove nbINBelow |
	
	nbINBelow := self numberOfControlIN.
	
	nbINAbove := 0.
	
	self coordinationRoles do: [ :aRole |						
		((self dictionaryOfCoordinationIndegree at: aRole) < 2) ifTrue: [ 
			(self controlRoles includes: aRole) ifTrue: [ 
				((self dictionaryOfControlIndegree at: aRole) < 2) ifTrue: [ 
					nbINAbove := nbINAbove + 1.
				]
			 ]			
		]
	].	
				
	Transcript show: ('Above : ', nbINAbove asString, ' Below : ', nbINBelow asString); cr.
	
	^ (nbINAbove / nbINBelow).