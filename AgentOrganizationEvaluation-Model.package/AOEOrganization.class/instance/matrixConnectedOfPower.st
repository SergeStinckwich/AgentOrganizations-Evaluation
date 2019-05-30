counting-power
matrixConnectedOfPower
	"Creat the matrix relations (connected) between two roles (vertex) in power dimension  - for the detour and overlap metrics. 
	Value of each cell is the distance between two roles
	-1 : two roles are same
	0 : two roles do not connected
	>0 : the distance between two roles 
	"
	
	| aMatrix n r c isLoop maxLength posEnd posTemp  |
	
	n := self numberOfRoles.
	aMatrix := Matrix new: n tabulate: [ :row :column | 0 ].
	
	"1. Initiation of Matrix Phase"
	(1 to: n) do: [ :rc |
		aMatrix at:rc at:rc put: -1.
	].
	
	self powerRoles do: [ :aRole |	
		r := self positionOfRole: aRole.		
		aRole powerRelations do: [ :aCPRole | 
										 c := self positionOfRole: aCPRole.									
										 aMatrix at: r at: c put: 1 ].	 
	].
	
	"2. Loop Phase"
	isLoop := true.
	maxLength := 0. "maximum path in the power graph"
	[ isLoop = true ] whileTrue: [ 
		isLoop := false.
		maxLength := maxLength + 1.
		self powerRoles do: [ :aRole |	
			posTemp := self positionOfRole: aRole.		
			aRole powerRelations do: [ :aCPRole | 
										 		posEnd := self positionOfRole: aCPRole.
												(1 to: n) do: [ :posStart |   													
													(posStart = posEnd) ifFalse: [ 
														((aMatrix at: posStart at: posTemp) = maxLength) ifTrue: [ 
															((aMatrix at: posStart at: posEnd) > (maxLength + 1)) ifTrue:[
																isLoop := true.
																aMatrix at: posStart at: posEnd put: (maxLength + 1).	
															] ifFalse: [ 
																((aMatrix at: posStart at: posEnd) = 0) ifTrue:[
																	isLoop := true.
																	aMatrix at: posStart at: posEnd put: (maxLength + 1).	
																]																																	
															]														
														].
													].
												].
											].	 
		].
	].
	
	"show matrix in Transcript"
	"(1 to: n) do: [ :row |
		(1 to: n) do: [ :column |
			Transcript show: ((aMatrix at:row at:column) asString, ' ').
		].
		Transcript cr.
	]."			
	
	^ aMatrix.