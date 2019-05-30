metrics-power
overlapOfPowerOverCoordination
	"Count the number of LINK in power over coordination"
	| aMatrix nbPath row column |
	
	nbPath := 0.
	aMatrix := self matrixConnectedOfPower.
	
	self coordinationRoles do: [ :aRole |	
		row := self positionOfRole: aRole.		
		aRole coordinationRelations do: [ :aCPRole | 
													column := self positionOfRole: aCPRole.
													((aMatrix at: row at: column) = 1) ifTrue:[
														nbPath := nbPath + 1.
													]
										 		 ].	 
	].
	
	^ nbPath / (self numberOfCoordinationRelations).