metrics-coordination
overlapOfCoordinationOverControl
	"Count the number of LINK in coordination over control"
	| aMatrix nbPath row column |
	
	nbPath := 0.
	aMatrix := self matrixConnectedOfCoordination.
	
	self controlRoles do: [ :aRole |	
		row := self positionOfRole: aRole.		
		aRole controlRelations do: [ :aCPRole | 
												column := self positionOfRole: aCPRole.
												((aMatrix at: row at: column) = 1) ifTrue:[
													nbPath := nbPath + 1.
												]
										 	].	 
	].
	
	^ nbPath / (self numberOfControlRelations).