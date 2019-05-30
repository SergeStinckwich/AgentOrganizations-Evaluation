metrics-coordination
outcoverOfCoordinationOverPower
	"Count the number of OutCover in coordination over power"
	| nbOUTAbove nbOUTBelow |
	
	nbOUTBelow := self numberOfPowerOUT.
	
	nbOUTAbove := 0.
	
	self coordinationRoles do: [ :aRole |						
		((aRole numberOfCoordinationOutdegree) < 2) ifTrue: [ 
			(self powerRoles includes: aRole) ifTrue: [ 
				((aRole numberOfPowerOutdegree) < 2) ifTrue: [ 
					nbOUTAbove := nbOUTAbove + 1.
				]
			]			
		]
	].	
				
	Transcript show: ('Above : ', nbOUTAbove asString, ' Below : ', nbOUTBelow asString); cr.
	
	^ (nbOUTAbove / nbOUTBelow).