metrics-control
overlapOfControlOverCoordination
	"Count the number of LINK in control over coordination"
	| aMatrix nbPath row column |
	
	nbPath := 0.
	aMatrix := self matrixConnectedOfControl.
	
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