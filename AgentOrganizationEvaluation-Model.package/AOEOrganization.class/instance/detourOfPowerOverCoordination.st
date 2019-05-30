metrics-power
detourOfPowerOverCoordination
	"Count the number of PATH in power over coordination"
	| aMatrix nbPath row column |
	
	nbPath := 0.
	aMatrix := self matrixConnectedOfPower.
	
	self coordinationRoles do: [ :aRole |	
		row := self positionOfRole: aRole.		
		aRole coordinationRelations do: [ :aCPRole | 
													column := self positionOfRole: aCPRole.
													((aMatrix at: row at: column) > 0) ifTrue:[
														nbPath := nbPath + 1.
													]
										 		 ].	 
	].

	Transcript show: ('Number of PATH : ', nbPath asString, ' Number of coordination relations : ', self numberOfCoordinationRelations asString); cr.
	
	^ nbPath / (self numberOfCoordinationRelations).