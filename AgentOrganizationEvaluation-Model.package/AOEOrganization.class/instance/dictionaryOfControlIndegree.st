counting-control
dictionaryOfControlIndegree
	"Count the indegree of each node in control relations"
	
	| inCollection number |
	
	inCollection := Dictionary new.
	
	self controlRoles do: [ :aRole | inCollection at: aRole put: 0 ].
	
	self controlRoles do: [ :aRole |	
		aRole controlRelations do: [ :aCPRole | 
										 number := inCollection at: aCPRole.
										 number := number + 1.
										 inCollection at: aCPRole put: number ].			
	].
	
	"self controlRoles do: [ :aRole |
		Transcript show: ('Role name : ', aRole roleName  asString, ' - Indegree : ', (inCollection at: aRole) asString ); cr.	
	]."
	
	^ inCollection.