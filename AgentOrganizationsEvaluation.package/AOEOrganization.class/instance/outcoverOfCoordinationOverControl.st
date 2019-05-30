metrics-coordination
outcoverOfCoordinationOverControl
	"Count the number of OutCover in coordination over control"
	| nbOUTAbove nbOUTBelow |
	
	nbOUTBelow := self numberOfControlOUT.
	
	nbOUTAbove := 0.
	
	self coordinationRoles do: [ :aRole |						
		((aRole numberOfCoordinationOutdegree) < 2) ifTrue: [ 
			(self controlRoles includes: aRole) ifTrue: [ 
				((aRole numberOfControlOutdegree) < 2) ifTrue: [ 
					nbOUTAbove := nbOUTAbove + 1.
				]
			]			
		]
	].	
				
	Transcript show: ('Above : ', nbOUTAbove asString, ' Below : ', nbOUTBelow asString); cr.
	
	^ (nbOUTAbove / nbOUTBelow).