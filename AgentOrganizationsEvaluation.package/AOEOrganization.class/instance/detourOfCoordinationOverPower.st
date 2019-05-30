metrics-coordination
detourOfCoordinationOverPower
	"Count the number of PATH in coordination over power"
	| aMatrix nbPath row column |
	
	nbPath := 0.
	aMatrix := self matrixConnectedOfCoordination.
	
	self powerRoles do: [ :aRole |	
		row := self positionOfRole: aRole.		
		aRole powerRelations do: [ :aCPRole | 
													column := self positionOfRole: aCPRole.
													((aMatrix at: row at: column) > 0) ifTrue:[
														nbPath := nbPath + 1.
													]
										 		 ].	 
	].

	Transcript show: ('Number of Overlap : ', nbPath asString, ' Number of power relations : ', self numberOfPowerRelations asString); cr.
	
	^ nbPath / (self numberOfPowerRelations).