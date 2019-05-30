metrics-coordination
overlapOfCoordinationOverPower
	"Count the number of LINK in coordination over power"
	| aMatrix nbPath row column numberOfPowerRelations|
	
	nbPath := 0.
	aMatrix := self matrixConnectedOfCoordination.
	
	self powerRoles do: [ :aRole |	
		row := self positionOfRole: aRole.		
		aRole powerRelations do: [ :aCPRole | 
													column := self positionOfRole: aCPRole.
													((aMatrix at: row at: column) = 1) ifTrue:[
														nbPath := nbPath + 1.
													]
										 		 ].	 
	].
	numberOfPowerRelations :=  (self numberOfPowerRelations).
	numberOfPowerRelations = 0  ifTrue:[ numberOfPowerRelations := 1].
	^ nbPath / numberOfPowerRelations.