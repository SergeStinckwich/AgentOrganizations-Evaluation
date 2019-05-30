metrics-control
overlapOfControlOverPower
	"Count the number of LINK in control over power"
	| aMatrix nbPath row column val|
	
	nbPath := 0.
	aMatrix := self matrixConnectedOfControl.
	
	self powerRoles do: [ :aRole |	
		row := self positionOfRole: aRole.		
		aRole powerRelations do: [ :aCPRole | 
													column := self positionOfRole: aCPRole.
													((aMatrix at: row at: column) = 1) ifTrue:[
														nbPath := nbPath + 1.
													]
										 		 ].	 
	].

	val := (self numberOfPowerRelations).
	val = 0 ifTrue:[ val := 1].	
	^ nbPath / val.