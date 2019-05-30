metrics-control
outcoverOfControlOverCoordination
	"Count the number of OutCover in control over coordination"
	| nbOUTAbove nbOUTBelow |
	
	nbOUTBelow := self numberOfCoordinationOUT.
	
	nbOUTAbove := 0.
	
	self controlRoles do: [ :aRole |						
		((aRole numberOfControlOutdegree) < 2) ifTrue: [ 
			(self coordinationRoles includes: aRole) ifTrue: [ 
				((aRole numberOfCoordinationOutdegree) < 2) ifTrue: [ 
					nbOUTAbove := nbOUTAbove + 1.
				]
			]			
		]
	].	
				
	Transcript show: ('Above : ', nbOUTAbove asString, ' Below : ', nbOUTBelow asString); cr.
	
	^ (nbOUTAbove / nbOUTBelow).