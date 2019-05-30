metrics-power
outcoverOfPowerOverControl
	"Count the number of OutCover in power over control"
	| nbOUTAbove nbOUTBelow |
	
	nbOUTBelow := self numberOfControlOUT.
	
	nbOUTAbove := 0.
	
	self powerRoles do: [ :aRole |						
		((aRole numberOfPowerOutdegree) < 2) ifTrue: [ 
			(self controlRoles includes: aRole) ifTrue: [ 
				((aRole numberOfControlOutdegree) < 2) ifTrue: [ 
					nbOUTAbove := nbOUTAbove + 1.
				]
			]			
		]
	].	
				
	Transcript show: ('Above : ', nbOUTAbove asString, ' Below : ', nbOUTBelow asString); cr.
	
	^ (nbOUTAbove / nbOUTBelow).