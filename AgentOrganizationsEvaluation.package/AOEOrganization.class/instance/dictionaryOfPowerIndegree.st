counting-power
dictionaryOfPowerIndegree
	"Count the indegree of each node in power relations"
	
	| inCollection number |
	
	inCollection := Dictionary new.
	
	self powerRoles do: [ :aRole | inCollection at: aRole put: 0 ].
	
	self powerRoles do: [ :aRole |	
		aRole powerRelations do: [ :aCPRole | 
										 number := inCollection at: aCPRole.
										 number := number + 1.
										 inCollection at: aCPRole put: number ].			
	].
	
	"self powerRoles do: [ :aRole |
		Transcript show: ('Role name : ', aRole roleName  asString, ' - Indegree : ', (inCollection at: aRole) asString ); cr.	
	]."
	
	^ inCollection.