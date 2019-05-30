counting-coordination
dictionaryOfCoordinationIndegree
	"Count the indegree of each node in coordination relations"
	
	| inCollection number |
	
	inCollection := Dictionary new.
	
	self coordinationRoles do: [ :aRole | inCollection at: aRole put: 0 ].
	
	self coordinationRoles do: [ :aRole |	
		aRole coordinationRelations do: [ :aCPRole | 
										 number := inCollection at: aCPRole.
										 number := number + 1.
										 inCollection at: aCPRole put: number ].			
	].
	
	"self coordinationRoles do: [ :aRole |
		Transcript show: ('Role name : ', aRole roleName  asString, ' - Indegree : ', (inCollection at: aRole) asString ); cr.	
	]."
	
	^ inCollection.