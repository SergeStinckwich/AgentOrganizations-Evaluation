metrics-power
detourOfPowerOverControl
	"Count the number of PATH in power over control"
	| aMatrix nbPath row column |
	
	nbPath := 0.
	aMatrix := self matrixConnectedOfPower.
	
	self controlRoles do: [ :aRole |	
		row := self positionOfRole: aRole.		
		aRole controlRelations do: [ :aCPRole | 
													column := self positionOfRole: aCPRole.
													((aMatrix at: row at: column) > 0) ifTrue:[
														nbPath := nbPath + 1.
													]
										 		 ].	 
	].

	Transcript show: ('Number of PATH : ', nbPath asString, ' Number of control relations : ', self numberOfControlRelations asString); cr.
	
	^ nbPath / (self numberOfControlRelations).