metrics-power
outcoverOfPowerOverCoordination
	"Count the number of OutCover in power over coordination"
	| nbOUTAbove nbOUTBelow |
	
	nbOUTBelow := self numberOfCoordinationOUT.
	
	nbOUTAbove := 0.
	
	self powerRoles do: [ :aRole |						
		((aRole numberOfPowerOutdegree) < 2) ifTrue: [ 
			(self coordinationRoles includes: aRole) ifTrue: [ 
				((aRole numberOfCoordinationOutdegree) < 2) ifTrue: [ 
					nbOUTAbove := nbOUTAbove + 1.
				]
			]			
		]
	].	
				
	Transcript show: ('Above : ', nbOUTAbove asString, ' Below : ', nbOUTBelow asString); cr.
	
	^ (nbOUTAbove / nbOUTBelow).