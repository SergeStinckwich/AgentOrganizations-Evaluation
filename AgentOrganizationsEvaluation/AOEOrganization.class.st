"
An AOEOrganization is a set of roles. Some metrics defined on graph proposed by Grossi :

(1) Completeness : measure if the graph is a complete graph or not (0 if completely disconnected, 1 if complete). How much does the given structure approximate the structure where all directed links are present ?

(2) Connectedness : measure if the graph is connected or not. How much is given structure split in fragment ?
DISCON : set of disconnected ordered pairs of each structural dimension <Roles, R>

(3) Economy: denote the balance between: keeping the structure connected and minimizing the number of links (minimizing completeness)
Economy (OS) > 1 => Connectedness(OS) < 1

(4) Unilaterality: Tendency to display an orientation in its links (number of symmetric links)
SIM: set of links (x,y) in R_k s.t (y,x) is also in R_k => |SIM| = 2 * number_of_symmetric_links

(5) Univocity: Tendency to display the absence of redundant links ending up (measure non ambiguous)
IN: set of roles x s.t. id_k(x) = 1 or = 0 (set of roles which either have indegree equal to 1 or they are a source of k or of some subgraph of k)

(6) Flatness: Measures the relative amount of points which are not intermediate point in a k-path, 
CUT: set of roles x s.t. id_k(x) >=1 and od_k(x) >=1 (set of roles which are at the same time addresser and addressee of k links)

(7) Detour: regards the degree to which a structural dimension j 'follows' a structural dimension k
PATH(j,k): set of ordered pairs (x,y) s.t. (x,y) in Rk and there exists a Rj-path from x to y (it means x also connects y in j)

(8) Overlap: a special case of Detour, with the length in Rj-path is equal 1

(9) InCover: concerns the extent to which all the incident roles of k are also incidents of j
IN: set of all elements x in Roles_k s.t id_k(x) <= 1.

								-----------------------------------------------
								
+ Robustness: measure of how stable in face of anticipated risks. Adding robustness thus adds complexity

+ Flexiblity: measure the looser cooperative association than classic hierarchical organizations.

+ Efficiency: mesure the amount of resources used by the organization to perform its tasks

   							           -----------------------------------------------
							                               Visualization
+ Add Rada Chart



  

"
Class {
	#name : #AOEOrganization,
	#superclass : #Object,
	#instVars : [
		'roles',
		'rbnGoodComplCoord',
		'rbnGoodConnCoord',
		'rbnGoodUnivPow',
		'rbnGoodUnilCoord',
		'rbnGoodUnivContr',
		'rbnGoodFlatContr',
		'rbnGoodOverlapCoordPow',
		'rbnGoodChainContrPow',
		'rbnGoodChainContrCoord',
		'rbnGoodInCoverContrCoord',
		'rbnGoodOutCoverPowContr',
		'rbnGoodOutCoverPowCoord',
		'lfxGoodComplPow',
		'lfxGoodComplCoord',
		'lfxGoodConnPow',
		'lfxGoodConnCoord',
		'lfxGoodChainContrPow',
		'lfxGoodOutCoverPowContr',
		'effGoodComplPow',
		'effGoodEconPow',
		'effGoodEconCoord',
		'effGoodOverlapCoordPow',
		'effGoodOverlapPowCoord',
		'effGoodUnilPow',
		'effGoodUnivPow',
		'effGoodEconContr',
		'effGoodOverlapContrPow',
		'effGoodOverlapPowContr'
	],
	#category : 'AgentOrganizationsEvaluation-Model'
}

{ #category : #adding }
AOEOrganization >> addRoles: aCollection [
	aCollection do: [ :each | self roles add: each ]
]

{ #category : #'metrics-control' }
AOEOrganization >> chainOfControlOverCoordination [
	"Count the number of Chain in control over coordination"
	| nbChainAbove nbChainBelow |
	
	nbChainBelow := self numberOfCoordinationOUT.
	
	nbChainAbove := 0.
	
	self controlRoles do: [ :aRole |						
		((self dictionaryOfControlIndegree at: aRole) < 2) ifTrue: [ 
			(self coordinationRoles includes: aRole) ifTrue: [ 
				((aRole numberOfCoordinationOutdegree) < 2) ifTrue: [ 
					nbChainAbove := nbChainAbove + 1.
				]
			]			
		]
	].	
				
	Transcript show: ('Above : ', nbChainAbove asString, ' Below : ', nbChainBelow asString); cr.
	
	^ (nbChainAbove / nbChainBelow).
]

{ #category : #'metrics-control' }
AOEOrganization >> chainOfControlOverPower [
	"Count the number of Chain in control over power"
	| nbChainAbove nbChainBelow |
	
	nbChainBelow := self numberOfPowerOUT.
	
	nbChainAbove := 0.
	
	self controlRoles do: [ :aRole |						
		((self dictionaryOfControlIndegree at: aRole) < 2) ifTrue: [ 
			(self powerRoles includes: aRole) ifTrue: [ 
				((aRole numberOfPowerOutdegree) < 2) ifTrue: [ 
					nbChainAbove := nbChainAbove + 1.
				]
			]			
		]
	].	
				
	Transcript show: ('Above : ', nbChainAbove asString, ' Below : ', nbChainBelow asString); cr.
	nbChainBelow = 0 ifTrue:[ nbChainBelow := 1].
	^ (nbChainAbove / nbChainBelow).
]

{ #category : #'metrics-coordination' }
AOEOrganization >> chainOfCoordinationOverControl [
	"Count the number of Chain in coordination over control"
	| nbChainAbove nbChainBelow |
	
	nbChainBelow := self numberOfControlOUT.
	
	nbChainAbove := 0.
	
	self coordinationRoles do: [ :aRole |						
		((self dictionaryOfCoordinationIndegree at: aRole) < 2) ifTrue: [ 
			(self controlRoles includes: aRole) ifTrue: [ 
				((aRole numberOfControlOutdegree) < 2) ifTrue: [ 
					nbChainAbove := nbChainAbove + 1.
				]
			]			
		]
	].	
				
	Transcript show: ('Above : ', nbChainAbove asString, ' Below : ', nbChainBelow asString); cr.
	
	^ (nbChainAbove / nbChainBelow).
]

{ #category : #'metrics-coordination' }
AOEOrganization >> chainOfCoordinationOverPower [
	"Count the number of Chain in coordination over power"
	| nbChainAbove nbChainBelow |
	
	nbChainBelow := self numberOfPowerOUT.
	
	nbChainAbove := 0.
	
	self coordinationRoles do: [ :aRole |						
		((self dictionaryOfCoordinationIndegree at: aRole) < 2) ifTrue: [ 
			(self powerRoles includes: aRole) ifTrue: [ 
				((aRole numberOfPowerOutdegree) < 2) ifTrue: [ 
					nbChainAbove := nbChainAbove + 1.
				]
			]			
		]
	].	
				
	Transcript show: ('Above : ', nbChainAbove asString, ' Below : ', nbChainBelow asString); cr.
	
	^ (nbChainAbove / nbChainBelow).
]

{ #category : #'metrics-power' }
AOEOrganization >> chainOfPowerOverControl [
	"Count the number of Chain in power over control"
	| nbChainAbove nbChainBelow |
	
	nbChainBelow := self numberOfControlOUT.
	
	nbChainAbove := 0.
	
	self powerRoles do: [ :aRole |						
		((self dictionaryOfPowerIndegree at: aRole) < 2) ifTrue: [ 
			(self controlRoles includes: aRole) ifTrue: [ 
				((aRole numberOfControlOutdegree) < 2) ifTrue: [ 
					nbChainAbove := nbChainAbove + 1.
				]
			]			
		]
	].	
				
	Transcript show: ('Above : ', nbChainAbove asString, ' Below : ', nbChainBelow asString); cr.
	
	^ (nbChainAbove / nbChainBelow).
]

{ #category : #'metrics-power' }
AOEOrganization >> chainOfPowerOverCoordination [
	"Count the number of Chain in power over coordination"
	| nbChainAbove nbChainBelow |
	
	nbChainBelow := self numberOfCoordinationOUT.
	
	nbChainAbove := 0.
	
	self powerRoles do: [ :aRole |						
		((self dictionaryOfPowerIndegree at: aRole) < 2) ifTrue: [ 
			(self coordinationRoles includes: aRole) ifTrue: [ 
				((aRole numberOfCoordinationOutdegree) < 2) ifTrue: [ 
					nbChainAbove := nbChainAbove + 1.
				]
			]			
		]
	].	
				
	Transcript show: ('Above : ', nbChainAbove asString, ' Below : ', nbChainBelow asString); cr.
	
	^ (nbChainAbove / nbChainBelow).
]

{ #category : #'metrics-control' }
AOEOrganization >> completenessOfControlStructure [
	| n |
	n := self numberOfControlRoles.
	^ self numberOfControlRelations / (n * (n - 1))
]

{ #category : #'metrics-coordination' }
AOEOrganization >> completenessOfCoordinationStructure [
	| n val|
	n := self numberOfCoordinationRoles.
	val := (n * (n - 1)).
	val = 0 ifTrue:[ val := 1].
	^ self numberOfCoordinationRelations / val.
]

{ #category : #'metrics-power' }
AOEOrganization >> completenessOfPowerStructure [
	| n div|
	n := self numberOfPowerRoles.
	div := (n * (n - 1)).
	div = 0 ifTrue:[ div := 1].
	^ self numberOfPowerRelations / div.
]

{ #category : #'metrics-control' }
AOEOrganization >> connectednessOfControlStructure [
	| n |
	n := self numberOfControlRoles.
	^ 1 - (self numberOfControlDisconnectedPairs / (n * (n - 1)))
]

{ #category : #'metrics-coordination' }
AOEOrganization >> connectednessOfCoordinationStructure [
	| n |
	n := self numberOfCoordinationRoles.
	^ 1 - (self numberOfCoordinationDisconnectedPairs / (n * (n - 1)))
]

{ #category : #'metrics-power' }
AOEOrganization >> connectednessOfPowerStructure [
	| n val|
	n := self numberOfPowerRoles.
	val := (n * (n - 1)).
	val = 0 ifTrue:[ val := 1].
	^ 1 - (self numberOfPowerDisconnectedPairs / val).
]

{ #category : #accessing }
AOEOrganization >> controlRoles [
	"Return the collection of roles involving the control relation"
	
	| controlSet |	
	
	"count the number of roles involved the control relations
	implemented by daidungsi 08.10.2014"
	
	controlSet := OrderedCollection new.
	
	"collection of AOERoles that have number of control relations bigger than 1"	
	"self roles do: [ :role | (role controlRelations size > 0) ifTrue: [role controlRelations do: [ :cpRole | controlSet add: cpRole]. controlSet add: role] ]."
	
	self roles do: [:role | (role controlRelations size > 0) ifTrue: [role controlRelations do: [:cpRole | (controlSet includes: cpRole) ifFalse: [controlSet add: cpRole] ]. (controlSet includes: role) ifFalse: [controlSet add: role] ] ].
	
	^controlSet
	
]

{ #category : #accessing }
AOEOrganization >> coordinationRoles [
	"Return the collection of roles involving the coordination relation"

	| coordinationSet |	
	
	"count the number of roles involved the coordination relations
	implemented by daidungsi 08.10.2014"
	
	coordinationSet := OrderedCollection new.
	
	"collection of AOERoles that have number of coordination relations bigger than 1"	
	self roles do: [:role | (role coordinationRelations size > 0) ifTrue: [role coordinationRelations do: [:cpRole | (coordinationSet includes: cpRole) ifFalse: [coordinationSet add: cpRole] ]. (coordinationSet includes: role) ifFalse: [coordinationSet add: role] ] ].
	
	^coordinationSet
]

{ #category : #'metrics-control' }
AOEOrganization >> detourOfControlOverCoordination [
	"Count the number of PATH in control over coordination"
	| aMatrix nbPath row column |
	
	nbPath := 0.
	aMatrix := self matrixConnectedOfControl.
	
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
]

{ #category : #'metrics-control' }
AOEOrganization >> detourOfControlOverPower [
	"Count the number of PATH in control over power"
	| aMatrix nbPath row column |
	
	nbPath := 0.
	aMatrix := self matrixConnectedOfControl.
	
	self powerRoles do: [ :aRole |	
		row := self positionOfRole: aRole.		
		aRole powerRelations do: [ :aCPRole | 
											column := self positionOfRole: aCPRole.
											((aMatrix at: row at: column) > 0) ifTrue:[
												nbPath := nbPath + 1.
											]
										 ].	 
	].

	Transcript show: ('Number of PATH : ', nbPath asString, ' Number of power relations : ', self numberOfPowerRelations asString); cr.
	
	^ nbPath / (self numberOfPowerRelations).
]

{ #category : #'metrics-coordination' }
AOEOrganization >> detourOfCoordinationOverControl [
	"Count the number of PATH in coordination over control"
	| aMatrix nbPath row column |
	
	nbPath := 0.
	aMatrix := self matrixConnectedOfCoordination.
	
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
]

{ #category : #'metrics-coordination' }
AOEOrganization >> detourOfCoordinationOverPower [
	"Count the number of PATH in coordination over power"
	| aMatrix nbPath row column |
	
	nbPath := 0.
	aMatrix := self matrixConnectedOfCoordination.
	
	self powerRoles do: [ :aRole |	
		row := self positionOfRole: aRole.		
		aRole powerRelations do: [ :aCPRole | 
													column := self positionOfRole: aCPRole.
													((aMatrix at: row at: column) > 0) ifTrue:[
														nbPath := nbPath + 1.
													]
										 		 ].	 
	].

	Transcript show: ('Number of Overlap : ', nbPath asString, ' Number of power relations : ', self numberOfPowerRelations asString); cr.
	
	^ nbPath / (self numberOfPowerRelations).
]

{ #category : #'metrics-power' }
AOEOrganization >> detourOfPowerOverControl [
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
]

{ #category : #'metrics-power' }
AOEOrganization >> detourOfPowerOverCoordination [
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
]

{ #category : #'counting-control' }
AOEOrganization >> dictionaryOfControlIndegree [
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
]

{ #category : #'counting-coordination' }
AOEOrganization >> dictionaryOfCoordinationIndegree [
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
]

{ #category : #'counting-power' }
AOEOrganization >> dictionaryOfPowerIndegree [
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
]

{ #category : #'metrics-control' }
AOEOrganization >> economyOfControlStructure [
	| m n tmp |
	m := self numberOfControlRelations.
	n := self numberOfControlRoles.	
	tmp := (m - (n - 1)) / (n * (n-1) - (n-1)).
	^ 1 - tmp
]

{ #category : #'metrics-coordination' }
AOEOrganization >> economyOfCoordinationStructure [
	| m n tmp |
	m := self numberOfCoordinationRelations.
	n := self numberOfCoordinationRoles.	
	tmp := (m - (n - 1)) / (n * (n-1) - (n-1)).
	^ 1 - tmp
]

{ #category : #'metrics-power' }
AOEOrganization >> economyOfPowerStructure [
	| m n tmp |
	m := self numberOfPowerRelations.
	n := self numberOfPowerRoles.	
	tmp := (m - (n - 1)) / (n * (n-1) - (n-1)).
	^ 1 - tmp
]

{ #category : #criteria }
AOEOrganization >> efficiency [
	"Mesure the amount of resources used by the organization to perform its tasks"
	| var |
	
	var := (self completenessOfPowerStructure - effGoodComplPow) squared.
	var := var + ((self economyOfPowerStructure - effGoodEconPow) squared).
	var := var + ((self economyOfCoordinationStructure - effGoodEconCoord) squared).
	var := var + ((self overlapOfCoordinationOverPower - effGoodOverlapCoordPow) squared).
	var := var + ((self overlapOfPowerOverCoordination - effGoodOverlapPowCoord) squared).
	var := var + ((self unilateralityOfPowerStructure - effGoodUnilPow) squared).	
	var := var + ((self univocityOfPowerStructure - effGoodUnivPow) squared).
	var := var + ((self economyOfControlStructure - effGoodEconContr) squared).
	var := var + ((self overlapOfControlOverPower - effGoodOverlapContrPow) squared).
	var := var + ((self overlapOfPowerOverControl - effGoodOverlapPowContr) squared).	
	
	Transcript show: ('Efficiency : ', var asString); cr.
	
	^ (var / 10).



]

{ #category : #'metrics-control' }
AOEOrganization >> flatnessOfControlStructure [
	^ 1 - ((self numberOfControlCUT) / (self numberOfControlRoles))
]

{ #category : #'metrics-coordination' }
AOEOrganization >> flatnessOfCoordinationStructure [
	^ 1 - ((self numberOfCoordinationCUT) / (self numberOfCoordinationRoles))
]

{ #category : #'metrics-power' }
AOEOrganization >> flatnessOfPowerStructure [
	^ 1 - ((self numberOfPowerCUT) / (self numberOfPowerRoles))
]

{ #category : #criteria }
AOEOrganization >> flexibility [
	"Measure the looser cooperative association than classic hierarchical organizations."
	| var |
	
	var := (self completenessOfPowerStructure - lfxGoodComplPow) squared.
	var := var + ((self completenessOfCoordinationStructure - lfxGoodComplCoord) squared).
	var := var + ((self connectednessOfPowerStructure  - lfxGoodConnPow) squared).
	var := var + ((self connectednessOfCoordinationStructure - lfxGoodConnCoord) squared).
	var := var + ((self chainOfControlOverPower - lfxGoodChainContrPow) squared).
	var := var + ((self outcoverOfPowerOverControl - lfxGoodOutCoverPowContr) squared).	
	
	Transcript show: ('Flexibility : ', var asString); cr.
	
	^ (var / 6).



]

{ #category : #'metrics-control' }
AOEOrganization >> incoverOfControlOverCoordination [
	"Count the number of InCover in control over coordination"
	| nbINAbove nbINBelow |
	
	nbINBelow := self numberOfCoordinationIN.
	
	nbINAbove := 0.
	
	self controlRoles do: [ :aRole |						
		((self dictionaryOfControlIndegree at: aRole) < 2) ifTrue: [ 
			(self coordinationRoles includes: aRole) ifTrue: [ 
				((self dictionaryOfCoordinationIndegree at: aRole) < 2) ifTrue: [ 
					nbINAbove := nbINAbove + 1.
				]
			 ]			
		]
	].	
				
	Transcript show: ('Above : ', nbINAbove asString, ' Below : ', nbINBelow asString); cr.
	
	^ (nbINAbove / nbINBelow).
]

{ #category : #'metrics-control' }
AOEOrganization >> incoverOfControlOverPower [
	"Count the number of InCover in control over power"
	| nbINAbove nbINBelow |
	
	nbINBelow := self numberOfPowerIN.
	
	nbINAbove := 0.
	
	self controlRoles do: [ :aRole |						
		((self dictionaryOfControlIndegree at: aRole) < 2) ifTrue: [ 
			(self powerRoles includes: aRole) ifTrue: [ 
				((self dictionaryOfPowerIndegree at: aRole) < 2) ifTrue: [ 
					nbINAbove := nbINAbove + 1.
				]
			 ]			
		]
	].	
				
	Transcript show: ('Above : ', nbINAbove asString, ' Below : ', nbINBelow asString); cr.
	
	^ (nbINAbove / nbINBelow).
]

{ #category : #'metrics-coordination' }
AOEOrganization >> incoverOfCoordinationOverControl [
	"Count the number of InCover in coordination over control"
	| nbINAbove nbINBelow |
	
	nbINBelow := self numberOfControlIN.
	
	nbINAbove := 0.
	
	self coordinationRoles do: [ :aRole |						
		((self dictionaryOfCoordinationIndegree at: aRole) < 2) ifTrue: [ 
			(self controlRoles includes: aRole) ifTrue: [ 
				((self dictionaryOfControlIndegree at: aRole) < 2) ifTrue: [ 
					nbINAbove := nbINAbove + 1.
				]
			 ]			
		]
	].	
				
	Transcript show: ('Above : ', nbINAbove asString, ' Below : ', nbINBelow asString); cr.
	
	^ (nbINAbove / nbINBelow).
]

{ #category : #'metrics-coordination' }
AOEOrganization >> incoverOfCoordinationOverPower [
	"Count the number of InCover in coordination over power"
	| nbINAbove nbINBelow |
	
	nbINBelow := self numberOfPowerIN.
	
	nbINAbove := 0.
	
	self coordinationRoles do: [ :aRole |						
		((self dictionaryOfCoordinationIndegree at: aRole) < 2) ifTrue: [ 
			(self powerRoles includes: aRole) ifTrue: [ 
				((self dictionaryOfPowerIndegree at: aRole) < 2) ifTrue: [ 
					nbINAbove := nbINAbove + 1.
				]
			 ]			
		]
	].	
				
	Transcript show: ('Above : ', nbINAbove asString, ' Below : ', nbINBelow asString); cr.
	
	^ (nbINAbove / nbINBelow).
]

{ #category : #'metrics-power' }
AOEOrganization >> incoverOfPowerOverControl [
	"Count the number of InCover in power over control"
	| nbINAbove nbINBelow |
	
	nbINBelow := self numberOfControlIN.
	
	nbINAbove := 0.
	
	self powerRoles do: [ :aRole |						
		((self dictionaryOfPowerIndegree at: aRole) < 2) ifTrue: [ 
			(self controlRoles includes: aRole) ifTrue: [ 
				((self dictionaryOfControlIndegree at: aRole) < 2) ifTrue: [ 
					nbINAbove := nbINAbove + 1.
				]
			]			
		]
	].	
				
	Transcript show: ('Above : ', nbINAbove asString, ' Below : ', nbINBelow asString); cr.
	
	^ (nbINAbove / nbINBelow).
]

{ #category : #'metrics-power' }
AOEOrganization >> incoverOfPowerOverCoordination [
	"Count the number of InCover in power over coordination"
	| nbINAbove nbINBelow |
	
	nbINBelow := self numberOfCoordinationIN.
	
	nbINAbove := 0.
	
	self powerRoles do: [ :aRole |						
		((self dictionaryOfPowerIndegree at: aRole) < 2) ifTrue: [ 
			(self coordinationRoles includes: aRole) ifTrue: [ 
				((self dictionaryOfCoordinationIndegree at: aRole) < 2) ifTrue: [ 
					nbINAbove := nbINAbove + 1.
				]
			]				
		]
	].	
				
	Transcript show: ('Above : ', nbINAbove asString, ' Below : ', nbINBelow asString); cr.
	
	^ (nbINAbove / nbINBelow).
]

{ #category : #initialization }
AOEOrganization >> initialize [
	roles := OrderedCollection new.
	
	"robustness criteria"
	rbnGoodComplCoord := 1.
	rbnGoodConnCoord := 1.
	rbnGoodUnivPow := 0.
	rbnGoodUnilCoord := 0.
	rbnGoodUnivContr := 0.
	rbnGoodFlatContr := 0.
	rbnGoodOverlapCoordPow := 1.
	rbnGoodChainContrPow := 1.
	rbnGoodChainContrCoord := 1.
	rbnGoodInCoverContrCoord := 1.
	rbnGoodOutCoverPowContr := 1.
	rbnGoodOutCoverPowCoord := 1.
	
	"flexibility criteria"
	lfxGoodComplPow := 0.
	lfxGoodComplCoord := 1.
	lfxGoodConnPow := 0.
	lfxGoodConnCoord := 1.
	lfxGoodChainContrPow := 1.
	lfxGoodOutCoverPowContr := 1.
	
	"efficiency criteria"
	effGoodComplPow := 1. 
	effGoodEconPow := 1.
	effGoodEconCoord := 1.
	effGoodOverlapCoordPow := 1. 
	effGoodOverlapPowCoord := 1.
	effGoodUnilPow := 1.
	effGoodUnivPow := 1.
	effGoodEconContr := 1.
	effGoodOverlapContrPow := 1. 
	effGoodOverlapPowContr := 1.
		
	
]

{ #category : #visualization }
AOEOrganization >> interactMetricsLine: aoeOrg withName: aoeOrgName [
	| dPowerCoord dPowerContr 
	  dCoordPower dCoordContr
	  dContrPower dContrCoord
	  xLabel builder bLegend |
	
	"prepare data"
	dPowerCoord := OrderedCollection new.
	dPowerCoord add: aoeOrg detourOfPowerOverCoordination.
	dPowerCoord add: aoeOrg overlapOfPowerOverCoordination.	
	dPowerCoord add: aoeOrg incoverOfPowerOverCoordination.	
	dPowerCoord add: aoeOrg outcoverOfPowerOverCoordination.
	dPowerCoord add: aoeOrg chainOfPowerOverCoordination.	
		
	dPowerContr := OrderedCollection new.
	dPowerContr add: aoeOrg detourOfPowerOverControl.
	dPowerContr add: aoeOrg overlapOfPowerOverControl.	
	dPowerContr add: aoeOrg incoverOfPowerOverControl.	
	dPowerContr add: aoeOrg outcoverOfPowerOverControl.
	dPowerContr add: aoeOrg chainOfPowerOverControl.		
	
	dCoordPower := OrderedCollection new.	
	dCoordPower add: aoeOrg detourOfCoordinationOverPower.
	dCoordPower add: aoeOrg overlapOfCoordinationOverPower.	
	dCoordPower add: aoeOrg incoverOfCoordinationOverPower.	
	dCoordPower add: aoeOrg outcoverOfCoordinationOverPower.
	dCoordPower add: aoeOrg chainOfCoordinationOverPower.	
		
	dCoordContr := OrderedCollection new.	
	dCoordContr add: aoeOrg detourOfCoordinationOverControl.
	dCoordContr add: aoeOrg overlapOfCoordinationOverControl.	
	dCoordContr add: aoeOrg incoverOfCoordinationOverControl.	
	dCoordContr add: aoeOrg outcoverOfCoordinationOverControl.
	dCoordContr add: aoeOrg chainOfCoordinationOverControl.

	dContrPower := OrderedCollection new.	
	dContrPower add: aoeOrg detourOfControlOverPower.
	dContrPower add: aoeOrg overlapOfControlOverPower.	
	dContrPower add: aoeOrg incoverOfControlOverPower.	
	dContrPower add: aoeOrg outcoverOfControlOverPower.
	dContrPower add: aoeOrg chainOfControlOverPower.	
		
	dContrCoord := OrderedCollection new.	
	dContrCoord add: aoeOrg detourOfControlOverCoordination.
	dContrCoord add: aoeOrg overlapOfControlOverCoordination.	
	dContrCoord add: aoeOrg incoverOfControlOverCoordination.	
	dContrCoord add: aoeOrg outcoverOfControlOverCoordination.
	dContrCoord add: aoeOrg chainOfControlOverCoordination.		
	
	xLabel := OrderedCollection new.
	xLabel add: 'Detour'.
	xLabel add: 'Overlap'.
	xLabel add: 'InCover'.
	xLabel add: 'OutCover'.
	xLabel add: 'Chain'.
			
	"build"		
	builder := RTKiviatBuilder new.
	builder extent: 350 @ 250.	
	builder interaction popup; highlight.		
	
	builder shape ellipse color: (Color red alpha: 0.3); size: 10.
	builder points: dPowerCoord.
	builder connectDotColor: Color red.
	
	builder shape ellipse color: (Color pink alpha: 0.3); size: 10.
	builder points: dPowerContr.
	builder connectDotColor: Color pink.
	
	builder shape rectangle color: (Color green alpha: 0.3); size: 8.
	builder points: dCoordPower.
	builder connectDotColor: Color green.	
		
	builder shape ellipse color: (Color blue alpha: 0.3); size: 10.
	builder points: dCoordContr.
	builder connectDotColor: Color blue.
	
	builder shape ellipse color: (Color black alpha: 0.3); size: 10.
	builder points: dContrPower.
	builder connectDotColor: Color black.
	
	builder shape rectangle color: (Color yellow alpha: 0.3); size: 8.
	builder points: dContrCoord.
	builder connectDotColor: Color yellow.	
	
	
	builder allY: #yourself.
	
	builder stackX.
	
	builder axisConfiguration 
		title: 'Value'.
	builder axisY.
	
	builder axisConfiguration 
		title: 'Metric';
		labelRotation: -30;		
		numberOfTicks: 5;
		numberOfLabels: 5;
		labelConvertion: [ :v | xLabel at: v ifAbsent: '' ].
	builder axisX.
	
	
	"defining the legend"	
	bLegend := RTLegendBuilder new.
	bLegend view: builder  view.
	bLegend addText: ('Distribution of 5 interactive metrics in ', aoeOrgName asString).
	
	bLegend addColor: Color red 	text: 'Power over Coordination'.
	bLegend addColor: Color pink 	text: 'Power over Control'.
	bLegend addColor: Color green 	text: 'Coordination over Power'.
	bLegend addColor: Color blue 	text: 'Coordination over Control'.
	bLegend addColor: Color black 	text: 'Control over Power'.
	bLegend addColor: Color yellow text: 'Control over Coordination'.
	
	bLegend build.

	builder open.
	
]

{ #category : #visualization }
AOEOrganization >> isolatedMetricsLine: aoeOrg [
	| dPowerMetrics dCoordMetrics dContrMetrics xLabel builder bLegend |
	
	"prepare data"
	dPowerMetrics := OrderedCollection new.
	dPowerMetrics add: aoeOrg completenessOfPowerStructure.
	dPowerMetrics add: aoeOrg connectednessOfPowerStructure.	
	dPowerMetrics add: aoeOrg economyOfPowerStructure.	
	dPowerMetrics add: aoeOrg unilateralityOfPowerStructure.
	dPowerMetrics add: aoeOrg univocityOfPowerStructure.	
	dPowerMetrics add: aoeOrg flatnessOfPowerStructure.
	
	dCoordMetrics := OrderedCollection new.	
	dCoordMetrics add: aoeOrg completenessOfCoordinationStructure.
	dCoordMetrics add: aoeOrg connectednessOfCoordinationStructure.	
	dCoordMetrics add: aoeOrg economyOfCoordinationStructure.	
	dCoordMetrics add: aoeOrg unilateralityOfCoordinationStructure.
	dCoordMetrics add: aoeOrg univocityOfCoordinationStructure.	
	dCoordMetrics add: aoeOrg flatnessOfCoordinationStructure.

	dContrMetrics := OrderedCollection new.	
	dContrMetrics add: aoeOrg completenessOfControlStructure.
	dContrMetrics add: aoeOrg connectednessOfControlStructure.	
	dContrMetrics add: aoeOrg economyOfControlStructure.	
	dContrMetrics add: aoeOrg unilateralityOfControlStructure.
	dContrMetrics add: aoeOrg univocityOfControlStructure.	
	dContrMetrics add: aoeOrg flatnessOfControlStructure.
	
	xLabel := OrderedCollection new.
	xLabel add: 'Completeness'.
	xLabel add: 'Connectedness'.
	xLabel add: 'Economy'.
	xLabel add: 'Unilaterality'.
	xLabel add: 'Univocity'.
	xLabel add: 'Flatness'.
			
	"build"	
	"
	builder allY: data size.
	builder histogramWithBarTitle: 'Metric'.
	builder axisY.
	builder newAxisConfiguration plain.
	builder axisX.	
	"		
	builder := RTKiviatBuilder new.
	builder extent: 350 @ 250.
	builder shape ellipse color: (Color blue alpha: 0.3); size: 10.
	builder interaction popup; highlight.
		
	
	builder points: dPowerMetrics.
	builder connectDotColor: Color red.
	
	builder points: dCoordMetrics.
	builder connectDotColor: Color green.
	
	builder points: dContrMetrics.
	builder connectDotColor: Color yellow.	
	
	
	builder allY: #yourself.
	
	builder stackX.
	
	builder axisConfiguration 
		title: 'Value'.
	builder axisY.
	
	builder axisConfiguration 
		title: 'Metric';
		labelRotation: -30;		
		numberOfTicks: 6;
		numberOfLabels: 6;
		labelConvertion: [ :v | xLabel at: v ifAbsent: '' ].
	builder axisX.
	
	"builder axisXWithNumberOfTicks: 0."
	"builder axisYWithNumberOfTicks: 4."
	
	"defining the legend"	
	bLegend := RTLegendBuilder new.
	bLegend view: builder  view.
	bLegend addText: 'Distribution of 6 isolated metrics'.
	
	bLegend addColor: Color red 	text: 'Power Dimension'.
	bLegend addColor: Color green 	text: 'Coordination Dimension'.
	bLegend addColor: Color yellow text: 'Control Dimension'.
	
	bLegend build.

	builder open.
	
]

{ #category : #visualization }
AOEOrganization >> isolatedMetricsLine: aoeOrg withName: aoeOrgName [
	| dPowerMetrics dCoordMetrics dContrMetrics xLabel builder bLegend |
	
	"prepare data"
	dPowerMetrics := OrderedCollection new.
	dPowerMetrics add: aoeOrg completenessOfPowerStructure.
	dPowerMetrics add: aoeOrg connectednessOfPowerStructure.	
	dPowerMetrics add: aoeOrg economyOfPowerStructure.	
	dPowerMetrics add: aoeOrg unilateralityOfPowerStructure.
	dPowerMetrics add: aoeOrg univocityOfPowerStructure.	
	dPowerMetrics add: aoeOrg flatnessOfPowerStructure.
	
	dCoordMetrics := OrderedCollection new.	
	dCoordMetrics add: aoeOrg completenessOfCoordinationStructure.
	dCoordMetrics add: aoeOrg connectednessOfCoordinationStructure.	
	dCoordMetrics add: aoeOrg economyOfCoordinationStructure.	
	dCoordMetrics add: aoeOrg unilateralityOfCoordinationStructure.
	dCoordMetrics add: aoeOrg univocityOfCoordinationStructure.	
	dCoordMetrics add: aoeOrg flatnessOfCoordinationStructure.

	dContrMetrics := OrderedCollection new.	
	dContrMetrics add: aoeOrg completenessOfControlStructure.
	dContrMetrics add: aoeOrg connectednessOfControlStructure.	
	dContrMetrics add: aoeOrg economyOfControlStructure.	
	dContrMetrics add: aoeOrg unilateralityOfControlStructure.
	dContrMetrics add: aoeOrg univocityOfControlStructure.	
	dContrMetrics add: aoeOrg flatnessOfControlStructure.
	
	xLabel := OrderedCollection new.
	xLabel add: 'Completeness'.
	xLabel add: 'Connectedness'.
	xLabel add: 'Economy'.
	xLabel add: 'Unilaterality'.
	xLabel add: 'Univocity'.
	xLabel add: 'Flatness'.
			
	"build"
	builder := RTKiviatBuilder new.
	builder extent: 350 @ 250.	
	builder interaction popup; highlight.		
	
	builder shape ellipse color: (Color red alpha: 0.3); size: 10.
	builder points: dPowerMetrics.
	builder connectDotColor: Color red.
	
	builder shape ellipse color: (Color green alpha: 0.3); size: 10.
	builder points: dCoordMetrics.
	builder connectDotColor: Color green.
	
	builder shape rectangle color: (Color black alpha: 0.3); size: 8.
	builder points: dContrMetrics.
	builder connectDotColor: Color black.	
	
	
	builder allY: #yourself.
	
	builder stackX.
	
	builder axisConfiguration 
		title: 'Value'.
	builder axisY.
	
	builder axisConfiguration 
		title: 'Metric';
		labelRotation: -30;		
		numberOfTicks: 6;
		numberOfLabels: 6;
		labelConvertion: [ :v | xLabel at: v ifAbsent: '' ].
	builder axisX.	
	
	"defining the legend"	
	bLegend := RTLegendBuilder new.
	bLegend view: builder  view.
	bLegend addText: ('Distribution of 6 isolated metrics in ', aoeOrgName asString).
	
	bLegend addColor: Color red 	text: 'Power Dimension'.
	bLegend addColor: Color green 	text: 'Coordination Dimension'.
	bLegend addColor: Color black 	text: 'Control Dimension'.
	
	bLegend build.

	builder open.
	
]

{ #category : #visualization }
AOEOrganization >> kiviatEfficiency: aoeOrg [ 
	"For Efficiency Criteria"
	
	| 	builder nbColor
		nbMetrics	
		dStandardMetrics dOrgMetrics |			
				
	"Prepare data"
	nbMetrics := 10.
					
	dStandardMetrics := #(1 1 1 1 1 1 1 1 1 1).	
	
	dOrgMetrics := OrderedCollection new.	
	dOrgMetrics add: aoeOrg connectednessOfPowerStructure.
	dOrgMetrics add: aoeOrg economyOfPowerStructure.	
	dOrgMetrics add: aoeOrg economyOfCoordinationStructure.	
	dOrgMetrics add: aoeOrg overlapOfCoordinationOverPower.
	dOrgMetrics add: aoeOrg overlapOfPowerOverCoordination.	
	
	dOrgMetrics add: aoeOrg unilateralityOfPowerStructure.	
	dOrgMetrics add: aoeOrg univocityOfPowerStructure.	
	dOrgMetrics add: aoeOrg economyOfControlStructure.		
	dOrgMetrics add: aoeOrg overlapOfControlOverPower.	
	dOrgMetrics add: aoeOrg overlapOfPowerOverControl.	
		
	"Build radar chart"
	builder := RTKiviatBuilder new.
	
	builder objects: {dOrgMetrics. dStandardMetrics.}.
	
	nbColor := RTMultiLinearColorForIdentity new objects: (builder objects).
	builder shape circle color: [ :value | nbColor rtValue: value kiviatNode named]; size: 10.
	
	(1 to: nbMetrics) do:[ :posMetric |
		builder addMetric: [ :metric | (metric asOrderedCollection) at: posMetric ifAbsent: 0 ].
	].
																		
	builder build.
	builder view open.
	
]

{ #category : #visualization }
AOEOrganization >> kiviatEfficiency: aoeOrg withName: aoeOrgName [
	"For Efficiency Criteria"
	
	| 	builder nbColor
		nbMetrics	
		dStandardMetrics dOrgMetrics |			
				
	"Prepare data"
	nbMetrics := 10.
					
	dStandardMetrics := #(1 1 1 1 1 1 1 1 1 1).	
	
	dOrgMetrics := OrderedCollection new.	
	dOrgMetrics add: aoeOrg connectednessOfPowerStructure.
	dOrgMetrics add: aoeOrg economyOfPowerStructure.	
	dOrgMetrics add: aoeOrg economyOfCoordinationStructure.	
	dOrgMetrics add: aoeOrg overlapOfCoordinationOverPower.
	dOrgMetrics add: aoeOrg overlapOfPowerOverCoordination.	
	
	dOrgMetrics add: aoeOrg unilateralityOfPowerStructure.	
	dOrgMetrics add: aoeOrg univocityOfPowerStructure.	
	dOrgMetrics add: aoeOrg economyOfControlStructure.		
	dOrgMetrics add: aoeOrg overlapOfControlOverPower.	
	dOrgMetrics add: aoeOrg overlapOfPowerOverControl.	
		
	"Build radar chart"
	builder := RTKiviatBuilder new.
	
	builder objects: {dOrgMetrics. dStandardMetrics.}.
	
	nbColor := RTMultiLinearColorForIdentity new objects: (builder objects).
	builder shape circle color: [ :value | nbColor rtValue: value kiviatNode named]; size: 10.
	
	(1 to: nbMetrics) do:[ :posMetric |
		builder addMetric: [ :metric | (metric asOrderedCollection) at: posMetric ifAbsent: 0 ].
	].
																		
	builder build.
	builder view open.
	
]

{ #category : #visualization }
AOEOrganization >> kiviatFlexibility: aoeOrg [ 
	"For Flexibility Criteria"
	
	| 	builder nbColor
		nbMetrics	
		dStandardMetrics dOrgMetrics |			
				
	"Prepare data"
	nbMetrics := 6.
		
	dStandardMetrics := #(0 0 1 1 1 1).	
	
	dOrgMetrics := OrderedCollection new.	
	dOrgMetrics add: aoeOrg completenessOfPowerStructure.
	dOrgMetrics add: aoeOrg connectednessOfPowerStructure.	
	dOrgMetrics add: aoeOrg chainOfControlOverPower.	
	dOrgMetrics add: aoeOrg completenessOfCoordinationStructure.
	dOrgMetrics add: aoeOrg connectednessOfCoordinationStructure.	
	dOrgMetrics add: aoeOrg outcoverOfPowerOverControl.	
		
	"Build radar chart"
	builder := RTKiviatBuilder new.
	
	builder objects: {dOrgMetrics. dStandardMetrics.}.
	
	nbColor := RTMultiLinearColorForIdentity new objects: (builder objects).
	builder shape circle color: [ :value | nbColor rtValue: value kiviatNode named]; size: 10.
	
	(1 to: nbMetrics) do:[ :posMetric |
		builder addMetric: [ :metric | (metric asOrderedCollection) at: posMetric ifAbsent: 0 ].
	].
																		
	builder build.
	builder view open.
	
]

{ #category : #visualization }
AOEOrganization >> kiviatFlexibility: aoeOrg withName: aoeOrgName [
	"For Flexibility Criteria"
	
	| 	builder nbColor
		nbMetrics	
		dStandardMetrics dOrgMetrics |			
				
	"Prepare data"
	nbMetrics := 6.
		
	dStandardMetrics := #(0 0 1 1 1 1).	
	
	dOrgMetrics := OrderedCollection new.	
	dOrgMetrics add: aoeOrg completenessOfPowerStructure.
	dOrgMetrics add: aoeOrg connectednessOfPowerStructure.	
	dOrgMetrics add: aoeOrg chainOfControlOverPower.	
	dOrgMetrics add: aoeOrg completenessOfCoordinationStructure.
	dOrgMetrics add: aoeOrg connectednessOfCoordinationStructure.	
	dOrgMetrics add: aoeOrg outcoverOfPowerOverControl.	
		
	"Build radar chart"
	builder := RTKiviatBuilder new.
	
	builder objects: {dOrgMetrics. dStandardMetrics.}.
	
	nbColor := RTMultiLinearColorForIdentity new objects: (builder objects).
	builder shape circle color: [ :value | nbColor rtValue: value kiviatNode named]; size: 10.
	
	(1 to: nbMetrics) do:[ :posMetric |
		builder addMetric: [ :metric | (metric asOrderedCollection) at: posMetric ifAbsent: 0 ].
	].
																		
	builder build.
	builder view open.
	
]

{ #category : #visualization }
AOEOrganization >> kiviatRobustness: aoeOrg [ 
	"For Robustness Criteria"
	
	| 	builder nbColor
		nbMetrics	"xLabel"
		dStandardMetrics dOrgMetrics |			
				
	"Prepare data"
	nbMetrics := 12.
	
	dStandardMetrics := #(1 1 0 0 0 0 1 1 1 1 1 1).	
	
	dOrgMetrics := OrderedCollection new.	
	dOrgMetrics add: aoeOrg completenessOfCoordinationStructure.
	dOrgMetrics add: aoeOrg connectednessOfCoordinationStructure.	
	dOrgMetrics add: aoeOrg univocityOfPowerStructure.	
	dOrgMetrics add: aoeOrg unilateralityOfCoordinationStructure.
	dOrgMetrics add: aoeOrg univocityOfControlStructure.	
	dOrgMetrics add: aoeOrg flatnessOfControlStructure.	
	
	dOrgMetrics add: aoeOrg overlapOfCoordinationOverPower.	
	dOrgMetrics add: aoeOrg chainOfControlOverPower.	
	dOrgMetrics add: aoeOrg chainOfControlOverCoordination.	
	dOrgMetrics add: aoeOrg incoverOfControlOverCoordination.		
	dOrgMetrics add: aoeOrg outcoverOfPowerOverControl.	
	dOrgMetrics add: aoeOrg outcoverOfPowerOverCoordination.	
	
	"xLabel := OrderedCollection new.
	xLabel add: 'Completeness of Coordination'.
	xLabel add: 'Connectedness of Coordination'.
	xLabel add: 'Univocity of Power'.
	xLabel add: 'Unilaterality Of Coordination'.
	xLabel add: 'Univocity of Control'.
	xLabel add: 'Flatness of Control'.
	
	xLabel add: 'Overlap of Coordination over Power'.
	xLabel add: 'Chain of Control over Power'.
	xLabel add: 'Chain of Control over Coordination'.
	xLabel add: 'InCover of Control over Coordination'.
	xLabel add: 'OutCover of Power over Control'.
	xLabel add: 'OutCover of Power over Coordination'."
	
	"Build radar chart"
	builder := RTKiviatBuilder new.
	
	builder objects: {dOrgMetrics. dStandardMetrics.}.
	
	nbColor := RTMultiLinearColorForIdentity new objects: (builder objects).
	builder shape circle color: [ :value | nbColor rtValue: value kiviatNode named]; size: 10.
	
	(1 to: nbMetrics) do:[ :posMetric |
		builder addMetric: [ :metric | (metric asOrderedCollection) at: posMetric ifAbsent: 0 ].
	].

	"builder addMetric: [ :metric | (metric asOrderedCollection) at: 1 ifAbsent: 0 ].
	builder addMetric: [ :metric | (metric asOrderedCollection) at: 8 ifAbsent: 0 ].
	builder addMetric: [ :metric | (metric asOrderedCollection) at: 9 ifAbsent: 0 ].
	builder addMetric: [ :metric | (metric asOrderedCollection) at: 10 ifAbsent: 0 ].
	builder addMetric: [ :metric | (metric asOrderedCollection) at: 11 ifAbsent: 0 ].
	builder addMetric: [ :metric | (metric asOrderedCollection) at: 12 ifAbsent: 0 ]."
																		
	builder build.
	builder view open.
	
]

{ #category : #visualization }
AOEOrganization >> kiviatRobustness: aoeOrg withName: aoeOrgName [
	"For Robustness Criteria"
	
	| 	builder nbColor
		nbMetrics	"xLabel"
		dStandardMetrics dOrgMetrics |			
				
	"Prepare data"
	nbMetrics := 12.
	
	dStandardMetrics := #(1 1 0 0 0 0 1 1 1 1 1 1).	
	
	dOrgMetrics := OrderedCollection new.	
	dOrgMetrics add: aoeOrg completenessOfCoordinationStructure.
	dOrgMetrics add: aoeOrg connectednessOfCoordinationStructure.	
	dOrgMetrics add: aoeOrg univocityOfPowerStructure.	
	dOrgMetrics add: aoeOrg unilateralityOfCoordinationStructure.
	dOrgMetrics add: aoeOrg univocityOfControlStructure.	
	dOrgMetrics add: aoeOrg flatnessOfControlStructure.	
	
	dOrgMetrics add: aoeOrg overlapOfCoordinationOverPower.	
	dOrgMetrics add: aoeOrg chainOfControlOverPower.	
	dOrgMetrics add: aoeOrg chainOfControlOverCoordination.	
	dOrgMetrics add: aoeOrg incoverOfControlOverCoordination.		
	dOrgMetrics add: aoeOrg outcoverOfPowerOverControl.	
	dOrgMetrics add: aoeOrg outcoverOfPowerOverCoordination.	
	
	"xLabel := OrderedCollection new.
	xLabel add: 'Completeness of Coordination'.
	xLabel add: 'Connectedness of Coordination'.
	xLabel add: 'Univocity of Power'.
	xLabel add: 'Unilaterality Of Coordination'.
	xLabel add: 'Univocity of Control'.
	xLabel add: 'Flatness of Control'.
	
	xLabel add: 'Overlap of Coordination over Power'.
	xLabel add: 'Chain of Control over Power'.
	xLabel add: 'Chain of Control over Coordination'.
	xLabel add: 'InCover of Control over Coordination'.
	xLabel add: 'OutCover of Power over Control'.
	xLabel add: 'OutCover of Power over Coordination'."
	
	"Build radar chart"
	builder := RTKiviatBuilder new.
	
	builder objects: {dOrgMetrics. dStandardMetrics.}.
	
	nbColor := RTMultiLinearColorForIdentity new objects: (builder objects).
	builder shape circle color: [ :value | nbColor rtValue: value kiviatNode named]; size: 10.
	
	(1 to: nbMetrics) do:[ :posMetric |
		builder addMetric: [ :metric | (metric asOrderedCollection) at: posMetric ifAbsent: 0 ].
	].

	"builder addMetric: [ :metric | (metric asOrderedCollection) at: 1 ifAbsent: 0 ].
	builder addMetric: [ :metric | (metric asOrderedCollection) at: 8 ifAbsent: 0 ].
	builder addMetric: [ :metric | (metric asOrderedCollection) at: 9 ifAbsent: 0 ].
	builder addMetric: [ :metric | (metric asOrderedCollection) at: 10 ifAbsent: 0 ].
	builder addMetric: [ :metric | (metric asOrderedCollection) at: 11 ifAbsent: 0 ].
	builder addMetric: [ :metric | (metric asOrderedCollection) at: 12 ifAbsent: 0 ]."
																		
	builder build.
	builder view open.
	
]

{ #category : #'counting-control' }
AOEOrganization >> matrixConnectedOfControl [
	"Creat the matrix relations (connected) between two roles (vertex) in control dimension  - for the detour and overlap metrics. 
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
	
	self controlRoles do: [ :aRole |	
		r := self positionOfRole: aRole.		
		aRole controlRelations do: [ :aCPRole | 
										 c := self positionOfRole: aCPRole.									
										 aMatrix at: r at: c put: 1 ].	 
	].
	
	"2. Loop Phase"
	isLoop := true.
	maxLength := 0. "maximum path in the control graph"
	[ isLoop = true ] whileTrue: [ 
		isLoop := false.
		maxLength := maxLength + 1.
		self controlRoles do: [ :aRole |	
			posTemp := self positionOfRole: aRole.		
			aRole controlRelations do: [ :aCPRole | 
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
]

{ #category : #'counting-coordination' }
AOEOrganization >> matrixConnectedOfCoordination [
	"Creat the matrix relations (connected) between two roles (vertex) in coordination dimension - for the detour and overlap metrics. 
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
	
	self coordinationRoles do: [ :aRole |	
		r := self positionOfRole: aRole.		
		aRole coordinationRelations do: [ :aCPRole | 
										 c := self positionOfRole: aCPRole.									
										 aMatrix at: r at: c put: 1 ].	 
	].
	
	"2. Loop Phase"
	isLoop := true.
	maxLength := 0. "maximum path in the coordination graph"
	[ isLoop = true ] whileTrue: [ 
		isLoop := false.
		maxLength := maxLength + 1.
		self coordinationRoles do: [ :aRole |	
			posTemp := self positionOfRole: aRole.		
			aRole coordinationRelations do: [ :aCPRole | 
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
	self roles do: [ :aRole |  Transcript show: ((aRole roleName)  asString, ' ').].
	Transcript cr.
	
	(1 to: n) do: [ :row |
		(1 to: n) do: [ :column |
			Transcript show: ((aMatrix at:row at:column) asString, ' ').
		].
		Transcript cr.
	].		
	
	^ aMatrix.
]

{ #category : #'counting-power' }
AOEOrganization >> matrixConnectedOfPower [
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
]

{ #category : #'counting-control' }
AOEOrganization >> numberOfControlCUT [
	"Count the number of CUT collection in control relations - for flatness metric"
	
	| number |
	
	number := 0.
	
	self controlRoles do: [ :aRole | 
		(aRole numberOfControlOutdegree > 0) ifTrue: [ "od_k(x) >= 1"
			((self dictionaryOfControlIndegree at: aRole) > 0) ifTrue: [ "id_k(x) >= 1"
				number := number + 1
			]
		]
	].
	
	^ number
]

{ #category : #'counting-control' }
AOEOrganization >> numberOfControlDisconnectedPairs [
	"Count the number of disconnected ordered pairs in control role graph
	We apply the assigned color algorithm:
	- Each vertex in the graph has a color
	- Two vertex have the same color, it means they are connected"

	| iColor nControl minColor isLoop numNodesSub nbDisPairs |
	
	iColor := 0.
	minColor := 0.
	isLoop := true.	
	
	nControl := self controlRoles size.
	
	[ isLoop = true ] whileTrue: [ 
		self controlRoles do: [ :aRole | 
			(aRole controlRelations size > 0) ifTrue: [ 
			isLoop := false.
			
			"find the minimum value in the subtree"
			minColor := nControl. "aRole roleColor."
			(aRole roleColor > 0) ifTrue: [ (aRole roleColor < minColor) ifTrue: [ minColor := aRole roleColor ] ].
			aRole controlRelations do: [ :aCPRole | (aCPRole roleColor > 0) ifTrue: [ 
												(aCPRole roleColor < minColor) ifTrue: [ "Change the color"																									
																                            "if it is not the initial value" 
																									(minColor = nControl) ifTrue: [ isLoop := true ]. 
																									minColor := aCPRole roleColor ].
											  ] ].
			
			(minColor = nControl) ifTrue: [iColor := iColor + 1.  minColor := iColor. isLoop := true. ].
								
			"assign minColor for all nodes in subtree"
			(isLoop = true) ifTrue: [  
				aRole addRoleColor: minColor.
				aRole controlRelations do: [ :aCPRole | aCPRole addRoleColor: minColor ].
			]
		 ] ].			
	].
	
	"count the number of nodes in each subtree using a dictionary"
	nbDisPairs := (nControl * (nControl - 1)).
	
	1 to: iColor do: [ :temp |		
		numNodesSub := 0.
		
		self controlRoles do: [ :aRole | (aRole roleColor = temp) ifTrue: [ numNodesSub := numNodesSub + 1 ]. ].				
		
		(numNodesSub > 0) ifTrue: [ nbDisPairs := nbDisPairs - (numNodesSub * (numNodesSub - 1)). ].	
			
		Transcript show: ('Color : ', temp asString, ' - Number of Nodes : ', numNodesSub asString, ' - Current nbDisPairs : ', nbDisPairs asString); cr.						
	].			
	
	"Transcript show: ('Number of color of role control graph : ', iColor asString); cr."
			
	"reset color"
	self controlRoles do: [ :aRole | aRole addRoleColor: 0 ].
	
	^ nbDisPairs
]

{ #category : #'counting-control' }
AOEOrganization >> numberOfControlIN [
	"Count the number of node which has the indegree <= 1 in control relations - for univocity, incover, chain metrics"
	| number |
		
	number := 0.
	
	self controlRoles do: [ :aRole |		
		( (self dictionaryOfControlIndegree at: aRole) < 2 ) ifTrue: [ number := number + 1 ].
	].	
	
	^ number.
]

{ #category : #'counting-control' }
AOEOrganization >> numberOfControlOUT [
	"Count the number of node which has the outdegree <= 1 in control relations - for univocity, outcover, chain metrics"
	| number |
		
	number := 0.
	
	self controlRoles do: [ :aRole |						
		( (aRole numberOfControlOutdegree) < 2 ) ifTrue: [ number := number + 1 ].
	].	
	
	^ number.
]

{ #category : #'counting-control' }
AOEOrganization >> numberOfControlRelations [
	^ self roles sum: [ :each | each controlRelations size ]
]

{ #category : #'counting-control' }
AOEOrganization >> numberOfControlRoles [	 
	"Return the size of collection of roles involving the control relation"
	
	"Transcript show: ('Number of roles involving the control relation : ', controlSet size asString); cr."
		
	^ self controlRoles size
]

{ #category : #'counting-control' }
AOEOrganization >> numberOfControlSIM [	
	"Count the number of symmetric links in control relations - for unilaterality metric"
	
	| number |
	
	number := 0.
	
	self controlRoles do: [ :aRole | 
		(aRole controlRelations size > 0) ifTrue: [
			aRole controlRelations do: [ :aCPRole |
				(aCPRole controlRelations includes: aRole) ifTrue: [ number := number + 1 ]
			]
		]
	].
	
	^ number
]

{ #category : #'counting-coordination' }
AOEOrganization >> numberOfCoordinationCUT [
	"Count the number of CUT collection in coordination relations - for flatness metric"
	
	| number |
	
	number := 0.
	
	self coordinationRoles do: [ :aRole | 
		(aRole numberOfCoordinationOutdegree > 0) ifTrue: [ "od_k(x) >= 1"
			((self dictionaryOfCoordinationIndegree at: aRole) > 0) ifTrue: [ "id_k(x) >= 1"
				number := number + 1
			]
		]
	].
	
	^ number
]

{ #category : #'counting-coordination' }
AOEOrganization >> numberOfCoordinationDisconnectedPairs [
	"Count the number of disconnected ordered pairs in coordination role graph
	We apply the assigned color algorithm:
	- Each vertex in the graph has a color
	- Two vertex have the same color, it means they are connected"

	| iColor nCoordination minColor isLoop numNodesSub nbDisPairs |
	
	iColor := 0.
	minColor := 0.
	isLoop := true.	
	
	nCoordination := self coordinationRoles size.
	
	[ isLoop = true ] whileTrue: [ 
		self coordinationRoles do: [ :aRole | 
			(aRole coordinationRelations size > 0) ifTrue: [ 
			isLoop := false.
			
			"find the minimum value in the subtree"
			minColor := nCoordination. "aRole roleColor."
			(aRole roleColor > 0) ifTrue: [ (aRole roleColor < minColor) ifTrue: [ minColor := aRole roleColor ] ].
			aRole coordinationRelations do: [ :aCPRole | (aCPRole roleColor > 0) ifTrue: [ 
														(aCPRole roleColor < minColor) ifTrue: [ "Change the color"
																                            "if it is not the initial value" 
																									(minColor = nCoordination) ifTrue: [ isLoop := true ]. 
																									minColor := aCPRole roleColor ].														 														
													 ] ].
			
			(minColor = nCoordination) ifTrue: [ iColor := iColor + 1.  minColor := iColor. isLoop := true. ].
								
			"assign minColor for all nodes in subtree"
			(isLoop = true) ifTrue: [  
				aRole addRoleColor: minColor.
				aRole coordinationRelations do: [ :aCPRole | aCPRole addRoleColor: minColor ].
			]
		 ] 
		] 
	].			

	
	"count the number of nodes in each subtree using a dictionary"
	nbDisPairs := (nCoordination * (nCoordination - 1)).
	
	1 to: iColor do: [ :temp |		
		numNodesSub := 0.
		
		self coordinationRoles do: [ :aRole | (aRole roleColor = temp) ifTrue: [ numNodesSub := numNodesSub + 1 ]. ].				
		
		(numNodesSub > 0) ifTrue: [ nbDisPairs := nbDisPairs - (numNodesSub * (numNodesSub - 1)). ].	
			
		Transcript show: ('Color : ', temp asString, ' - Number of Nodes : ', numNodesSub asString, ' - Current nbDisPairs : ', nbDisPairs asString); cr.						
	].			
	
	"Transcript show: ('Number of color of role coordination graph : ', iColor asString); cr."
			
	"reset color"
	self coordinationRoles do: [ :aRole | aRole addRoleColor: 0 ].
	
	^ nbDisPairs 
]

{ #category : #'counting-coordination' }
AOEOrganization >> numberOfCoordinationIN [
	"Count the number of node which has the indegree <= 1 in coordination relations - for univocity, incover, chain metrics"
	| number |
		
	number := 0.
	
	self coordinationRoles do: [ :aRole |		
		( (self dictionaryOfCoordinationIndegree at: aRole) < 2 ) ifTrue: [ number := number + 1 ].
	].	
	
	^ number.
]

{ #category : #'counting-coordination' }
AOEOrganization >> numberOfCoordinationOUT [
	"Count the number of node which has the outdegree <= 1 in coordination relations - for univocity, outcover, chain metrics"
	| number |
		
	number := 0.
	
	self coordinationRoles do: [ :aRole |						
		( (aRole numberOfCoordinationOutdegree) < 2 ) ifTrue: [ number := number + 1 ].
	].	
	
	^ number.
]

{ #category : #'counting-coordination' }
AOEOrganization >> numberOfCoordinationRelations [
	^ self roles sum: [ :each | each coordinationRelations size ]
]

{ #category : #'counting-coordination' }
AOEOrganization >> numberOfCoordinationRoles [	
	"Return the size of collection of roles involving the coordination relation"
		
	"Transcript show: ('Number of roles involving the coordination relation : ', coordinationSet size asString); cr."
		
	^ self coordinationRoles size	
]

{ #category : #'counting-coordination' }
AOEOrganization >> numberOfCoordinationSIM [
	
	"Count the number of symmetric links in coordination relations - for unilaterality metric"
	
	| number |
	
	number := 0.
	
	self coordinationRoles do: [ :aRole | 
		(aRole coordinationRelations size > 0) ifTrue: [
			aRole coordinationRelations do: [ :aCPRole |
				(aCPRole coordinationRelations includes: aRole) ifTrue: [ number := number + 1 ]
			]
		]
	].
	
	^ number
]

{ #category : #'counting-power' }
AOEOrganization >> numberOfPathPowerOverCoordination [
	"Count the number of PATHs links with power over coordination - for Detour and Overlap metric"
	
	| number |
	
	number := 0.
	
	self coordinationRoles do: [ :aRole | "x"
		(aRole coordinationRelations size > 0) ifTrue: [
			aRole powerRelations do: [ :aCPRole | "y"
				(aCPRole powerRelations includes: aRole) ifTrue: [ number := number + 1 ]
			]
		]
	].
	
	^ number
]

{ #category : #'counting-power' }
AOEOrganization >> numberOfPowerCUT [
	"Count the number of CUT collection in power relations - for flatness metric"
	
	| number |
	
	number := 0.
	
	self powerRoles do: [ :aRole | 
		(aRole numberOfPowerOutdegree > 0) ifTrue: [ "od_k(x) >= 1"
			((self dictionaryOfPowerIndegree at: aRole) > 0) ifTrue: [ "id_k(x) >= 1"
				number := number + 1
			]
		]
	].
	
	^ number
]

{ #category : #'counting-power' }
AOEOrganization >> numberOfPowerDisconnectedPairs [
	"Count the number of disconnected ordered pairs in power role graph
	We apply the assigned color algorithm:
	- Each vertex in the graph has a color
	- Two vertex have the same color, it means they are connected"

	| iColor nPower minColor isLoop numNodesSub nbDisPairs |
	
	iColor := 0.
	minColor := 0.
	isLoop := true.	
	
	nPower := self powerRoles size.
	
	[ isLoop = true ] whileTrue:
	[ 
	self powerRoles size = 0 ifTrue:[isLoop := false.].
	self powerRoles do: 
		[ :aRole | 
		(aRole powerRelations size > 0) ifTrue: [ 
			isLoop := false.
			
			"find the minimum value in the subtree"
			minColor := nPower. "aRole roleColor."
			(aRole roleColor > 0) ifTrue: [ (aRole roleColor < minColor) ifTrue: [ minColor := aRole roleColor ] ].
			aRole powerRelations do: [ :aCPRole | (aCPRole roleColor > 0) ifTrue: [ 
												(aCPRole roleColor < minColor) ifTrue: [ "Change the color"
																                            "if it is not the initial value" 
																									(minColor = nPower) ifTrue: [ isLoop := true ]. 
																									minColor := aCPRole roleColor ].
											] ].
			
			(minColor = nPower) ifTrue: [iColor := iColor + 1.  minColor := iColor. isLoop := true. ].
								
			"assign minColor for all nodes in subtree"
			(isLoop = true) ifTrue: [  
				aRole addRoleColor: minColor.
				aRole powerRelations do: [ :aCPRole | aCPRole addRoleColor: minColor ].
			]
		 ] ].			
	].
	
	"count the number of nodes in each subtree using a dictionary"
	nbDisPairs := (nPower * (nPower - 1)).
	
	1 to: iColor do: [ :temp |		
		numNodesSub := 0.
		
		self powerRoles do: [ :aRole | (aRole roleColor = temp) ifTrue: [ numNodesSub := numNodesSub + 1 ]. ].				
		
		(numNodesSub > 0) ifTrue: [ nbDisPairs := nbDisPairs - (numNodesSub * (numNodesSub - 1)). ].	
			
		Transcript show: ('Color : ', temp asString, ' - Number of Nodes : ', numNodesSub asString, ' - Current nbDisPairs : ', nbDisPairs asString); cr.
	].			
	
	"Transcript show: ('Number of color of role power graph : ', iColor asString); cr."
			
	"reset color"
	self powerRoles do: [ :aRole | aRole addRoleColor: 0 ].
	
	^ nbDisPairs
	"^ (nbDisPairs / 2)"
]

{ #category : #'counting-power' }
AOEOrganization >> numberOfPowerIN [
	"Count the number of node which has the indegree <= 1 in power relations - for univocity, incover, chain metrics"
	| number |
		
	number := 0.
	
	self powerRoles do: [ :aRole |						
		( (self dictionaryOfPowerIndegree at: aRole) < 2 ) ifTrue: [ number := number + 1 ].
	].	
	
	^ number.
]

{ #category : #'counting-power' }
AOEOrganization >> numberOfPowerOUT [
	"Count the number of node which has the outdegree <= 1 in power relations - for univocity, outcover, chain metrics"
	| number |
		
	number := 0.
	
	self powerRoles do: [ :aRole |						
		( (aRole numberOfPowerOutdegree) < 2 ) ifTrue: [ number := number + 1 ].
	].	
	
	^ number.
]

{ #category : #'counting-power' }
AOEOrganization >> numberOfPowerRelations [
	^ self roles sum: [ :each | each powerRelations size ]
]

{ #category : #'counting-power' }
AOEOrganization >> numberOfPowerRoles [
	"Return the size of collection of roles involving the power relation"
	
	"Transcript show: ('Number of roles involving the power relation : ', powerSet size asString); cr."
		
	^ self powerRoles size
	
	"self flag:#todo."
]

{ #category : #'counting-power' }
AOEOrganization >> numberOfPowerSIM [
	"Count the number of symmetric links in power relations - for unilaterality metric"
	
	| number |
	
	number := 0.
	
	self powerRoles do: [ :aRole | 
		(aRole powerRelations size > 0) ifTrue: [
			aRole powerRelations do: [ :aCPRole |
				(aCPRole powerRelations includes: aRole) ifTrue: [ number := number + 1 ]
			]
		]
	].
	
	^ number
]

{ #category : #accessing }
AOEOrganization >> numberOfRoles [
	^ self roles size
]

{ #category : #'metrics-control' }
AOEOrganization >> outcoverOfControlOverCoordination [
	"Count the number of OutCover in control over coordination"
	| nbOUTAbove nbOUTBelow |
	
	nbOUTBelow := self numberOfCoordinationOUT.
	
	nbOUTAbove := 0.
	
	self controlRoles do: [ :aRole |						
		((aRole numberOfControlOutdegree) < 2) ifTrue: [ 
			(self coordinationRoles includes: aRole) ifTrue: [ 
				((aRole numberOfCoordinationOutdegree) < 2) ifTrue: [ 
					nbOUTAbove := nbOUTAbove + 1.
				]
			]			
		]
	].	
				
	Transcript show: ('Above : ', nbOUTAbove asString, ' Below : ', nbOUTBelow asString); cr.
	
	^ (nbOUTAbove / nbOUTBelow).
]

{ #category : #'metrics-control' }
AOEOrganization >> outcoverOfControlOverPower [
	"Count the number of OutCover in control over power"
	| nbOUTAbove nbOUTBelow |
	
	nbOUTBelow := self numberOfPowerOUT.
	
	nbOUTAbove := 0.
	
	self controlRoles do: [ :aRole |						
		((aRole numberOfControlOutdegree) < 2) ifTrue: [ 
			(self powerRoles includes: aRole) ifTrue: [ 
				((aRole numberOfPowerOutdegree) < 2) ifTrue: [ 
					nbOUTAbove := nbOUTAbove + 1.
				]
			]			
		]
	].	
				
	Transcript show: ('Above : ', nbOUTAbove asString, ' Below : ', nbOUTBelow asString); cr.
	
	^ (nbOUTAbove / nbOUTBelow).
]

{ #category : #'metrics-coordination' }
AOEOrganization >> outcoverOfCoordinationOverControl [
	"Count the number of OutCover in coordination over control"
	| nbOUTAbove nbOUTBelow |
	
	nbOUTBelow := self numberOfControlOUT.
	
	nbOUTAbove := 0.
	
	self coordinationRoles do: [ :aRole |						
		((aRole numberOfCoordinationOutdegree) < 2) ifTrue: [ 
			(self controlRoles includes: aRole) ifTrue: [ 
				((aRole numberOfControlOutdegree) < 2) ifTrue: [ 
					nbOUTAbove := nbOUTAbove + 1.
				]
			]			
		]
	].	
				
	Transcript show: ('Above : ', nbOUTAbove asString, ' Below : ', nbOUTBelow asString); cr.
	
	^ (nbOUTAbove / nbOUTBelow).
]

{ #category : #'metrics-coordination' }
AOEOrganization >> outcoverOfCoordinationOverPower [
	"Count the number of OutCover in coordination over power"
	| nbOUTAbove nbOUTBelow |
	
	nbOUTBelow := self numberOfPowerOUT.
	
	nbOUTAbove := 0.
	
	self coordinationRoles do: [ :aRole |						
		((aRole numberOfCoordinationOutdegree) < 2) ifTrue: [ 
			(self powerRoles includes: aRole) ifTrue: [ 
				((aRole numberOfPowerOutdegree) < 2) ifTrue: [ 
					nbOUTAbove := nbOUTAbove + 1.
				]
			]			
		]
	].	
				
	Transcript show: ('Above : ', nbOUTAbove asString, ' Below : ', nbOUTBelow asString); cr.
	
	^ (nbOUTAbove / nbOUTBelow).
]

{ #category : #'metrics-power' }
AOEOrganization >> outcoverOfPowerOverControl [
	"Count the number of OutCover in power over control"
	| nbOUTAbove nbOUTBelow |
	
	nbOUTBelow := self numberOfControlOUT.
	
	nbOUTAbove := 0.
	
	self powerRoles do: [ :aRole |						
		((aRole numberOfPowerOutdegree) < 2) ifTrue: [ 
			(self controlRoles includes: aRole) ifTrue: [ 
				((aRole numberOfControlOutdegree) < 2) ifTrue: [ 
					nbOUTAbove := nbOUTAbove + 1.
				]
			]			
		]
	].	
				
	Transcript show: ('Above : ', nbOUTAbove asString, ' Below : ', nbOUTBelow asString); cr.
	
	^ (nbOUTAbove / nbOUTBelow).
]

{ #category : #'metrics-power' }
AOEOrganization >> outcoverOfPowerOverCoordination [
	"Count the number of OutCover in power over coordination"
	| nbOUTAbove nbOUTBelow |
	
	nbOUTBelow := self numberOfCoordinationOUT.
	
	nbOUTAbove := 0.
	
	self powerRoles do: [ :aRole |						
		((aRole numberOfPowerOutdegree) < 2) ifTrue: [ 
			(self coordinationRoles includes: aRole) ifTrue: [ 
				((aRole numberOfCoordinationOutdegree) < 2) ifTrue: [ 
					nbOUTAbove := nbOUTAbove + 1.
				]
			]			
		]
	].	
				
	Transcript show: ('Above : ', nbOUTAbove asString, ' Below : ', nbOUTBelow asString); cr.
	
	^ (nbOUTAbove / nbOUTBelow).
]

{ #category : #'metrics-control' }
AOEOrganization >> overlapOfControlOverCoordination [
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
]

{ #category : #'metrics-control' }
AOEOrganization >> overlapOfControlOverPower [
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
]

{ #category : #'metrics-coordination' }
AOEOrganization >> overlapOfCoordinationOverControl [
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
]

{ #category : #'metrics-coordination' }
AOEOrganization >> overlapOfCoordinationOverPower [
	"Count the number of LINK in coordination over power"
	| aMatrix nbPath row column numberOfPowerRelations|
	
	nbPath := 0.
	aMatrix := self matrixConnectedOfCoordination.
	
	self powerRoles do: [ :aRole |	
		row := self positionOfRole: aRole.		
		aRole powerRelations do: [ :aCPRole | 
													column := self positionOfRole: aCPRole.
													((aMatrix at: row at: column) = 1) ifTrue:[
														nbPath := nbPath + 1.
													]
										 		 ].	 
	].
	numberOfPowerRelations :=  (self numberOfPowerRelations).
	numberOfPowerRelations = 0  ifTrue:[ numberOfPowerRelations := 1].
	^ nbPath / numberOfPowerRelations.
]

{ #category : #'metrics-power' }
AOEOrganization >> overlapOfPowerOverControl [
	"Count the number of LINK in power over control"
	| aMatrix nbPath row column |
	
	nbPath := 0.
	aMatrix := self matrixConnectedOfPower.
	
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
]

{ #category : #'metrics-power' }
AOEOrganization >> overlapOfPowerOverCoordination [
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
]

{ #category : #accessing }
AOEOrganization >> positionOfRole: aRole [
	"Get the position of a role in collection of roles"
	| position number|	 
	
	number := 0.
	self roles do: [:each | 
		number := number + 1.
		(aRole = each ) ifTrue: [ position := number ]
	].

	^ position
]

{ #category : #accessing }
AOEOrganization >> powerRoles [
	"Return the collection of roles involving the power relation"

	| powerSet |	
	
	"count the number of roles involved the power relations
	implemented by daidungsi 08.10.2014"
	
	powerSet := OrderedCollection new.
	
	"collection of AOERoles that have number of power relations bigger than 1"	
	"self roles do: [ :role | (role powerRelations size > 0) ifTrue: [role powerRelations do: [ :cpRole | powerSet add: cpRole]. powerSet add: role] ]."
	
	self roles do: [:aRole | 
		(aRole powerRelations size > 0) ifTrue: [
			aRole powerRelations do: [:aCPRole | 
				(powerSet includes: aCPRole) ifFalse: [
					powerSet add: aCPRole] 
				]. 
			(powerSet includes: aRole) ifFalse: [
				powerSet add: aRole] 
			] 
		]. 
	
	^powerSet
]

{ #category : #visualization }
AOEOrganization >> radarChartView: view withNbMetrics: nbMetrics withLabel: xLabel withStandardMetrics: dStandardMetrics withOrgMetrics: dOrgMetrics [
	
	| 	ellipseSize 
		colorEllipse colorLine colorStandard colorOrg	
		radarNbStages radarStageDegree radarCirleRadius 
		viewCenterPos 		  
		 		
		colPoints	   
		colEdges
		pointCenter
		aLine
		pos posValue posX posY |
	
	"*** Parameters"				
	ellipseSize := 5.	
	
	colorEllipse 	:= Color black alpha: 0.8.
	colorLine 		:= Color black alpha: 0.4.
	colorStandard 	:= Color red alpha: 0.8.
	colorOrg 			:= Color green alpha: 0.8.
	
	radarCirleRadius 	:= 50.	
	radarNbStages 		:= 4. 
	radarStageDegree 	:= 0.25.
	
	viewCenterPos := 0 @ 0.	
	
	colEdges := OrderedCollection new.	
		
	"colPoints do: [ :aPoint | view removeElement: aPoint ].
	colEdges do: [ :aEdge | view removeEdge: aEdge ].
	view elements do: #remove.
	view edges do: #remove."
		
	"*** Create elements"				
	pointCenter := (RTEllipse new size: ellipseSize; color: colorEllipse) element.
	pointCenter translateTo: viewCenterPos.	
	view add: pointCenter.				
		
	"Radar view"
	(1 to: radarNbStages) do:[ :i |
		
		colPoints := (RTEllipse new size: ellipseSize; color: colorEllipse) elementsOn: (1 to: nbMetrics). 						
		view addAll: colPoints.
	
		RTCircleLayout new initialRadius: (i * radarCirleRadius); on: colPoints.
		colPoints translateTo: viewCenterPos.
		
		pos := 0.
		colPoints do: [ :aPoint |
			pos := pos + 1.									
			
			(i = radarNbStages) ifTrue: [					
				"aPoint @ (RTLabelled new text: (xLabel at: pos ifAbsent: ''))."
				colEdges add: (RTLine edgeFrom: aPoint to: pointCenter). "connect to center element"
			] ifFalse: [
				(i = 1) ifTrue: [ 
					(pos = 1) ifTrue: [ 
						"connect to center element with degree"
						aLine := RTEdge from: aPoint to: pointCenter.
						aLine + (RTLine new color: colorLine).														
						view addAll: (Array with: aPoint with: pointCenter with: aLine).
						aLine @ (RTLabelled new text: (radarStageDegree asString)).
					]						
				]
			].	
			
			aPoint @ (RTPopup new text: (xLabel at: pos ifAbsent: '')).
			
			"Connect to beside element"
			colEdges add: (RTLine edgeFrom: aPoint to: (colPoints at: ((pos %  nbMetrics) + 1 ) ifAbsent: pointCenter)).
		].		
	].					
		
	"Create standard line"		
	colPoints := (RTEllipse new size: (2 * ellipseSize); color: colorStandard) elementsOn: (1 to: nbMetrics). 
	view addAll: colPoints.				
	
	pos := 0.	
	colPoints do: [ :aPoint |			
		pos := pos + 1.
		
		posValue := radarCirleRadius * ((dStandardMetrics at: pos ifAbsent: 0) / radarStageDegree).
		posX := ((pos-1) * (2 * Float pi) / nbMetrics) cos * posValue.
		posY := ((pos-1) * (2 * Float pi) / nbMetrics) sin * posValue.
		
		aPoint translateTo: posX @ posY.
		
		aPoint @ RTLabelled.
			
		"Connect to beside element"
		colEdges add: (RTLine new color: colorStandard; edgeFrom: aPoint to: (colPoints at: ((pos %  nbMetrics) + 1 ) ifAbsent: pointCenter)).
	].
	
	"Create organization line"		
	colPoints := (RTEllipse new size: (2 * ellipseSize); color: colorOrg) elementsOn: (1 to: nbMetrics). 
	view addAll: colPoints.				
		
	pos := 0.	
	colPoints do: [ :aPoint |			
		pos := pos + 1.
		
		posValue := radarCirleRadius * ((dOrgMetrics at: pos ifAbsent: 0) / radarStageDegree).
		posX := ((pos-1) * (2 * Float pi) / nbMetrics) cos * posValue.
		posY := ((pos-1) * (2 * Float pi) / nbMetrics) sin * posValue.
		
		aPoint translateTo: posX @ posY.
		
		aPoint @ (RTPopup new text: ((dOrgMetrics at: pos ifAbsent: 0) asString)).
			
		"Connect to beside element"
		colEdges add: (RTLine new color: colorOrg; edgeFrom: aPoint to: (colPoints at: ((pos %  nbMetrics) + 1 ) ifAbsent: pointCenter)).
	].
	
	view addAll: colEdges.	
																				
	^ view.
]

{ #category : #criteria }
AOEOrganization >> robustness [
	"Measure of how stable in face of anticipated risks."
	| var |
	
	var := (self completenessOfCoordinationStructure - rbnGoodComplCoord) squared.
	var := var + ((self connectednessOfCoordinationStructure - rbnGoodConnCoord) squared).
	var := var + ((self univocityOfPowerStructure  - rbnGoodUnivPow) squared).
	var := var + ((self unilateralityOfCoordinationStructure - rbnGoodUnilCoord) squared).
	var := var + ((self univocityOfControlStructure - rbnGoodUnivContr) squared).
	var := var + ((self flatnessOfControlStructure - rbnGoodFlatContr) squared).
	var := var + ((self overlapOfCoordinationOverPower - rbnGoodOverlapCoordPow) squared).
	var := var + ((self chainOfControlOverPower - rbnGoodChainContrPow) squared).
	var := var + ((self chainOfControlOverCoordination - rbnGoodChainContrCoord) squared).
	var := var + ((self incoverOfControlOverCoordination - rbnGoodInCoverContrCoord) squared).
	var := var + ((self outcoverOfPowerOverControl - rbnGoodOutCoverPowContr) squared).
	var := var + ((self outcoverOfPowerOverCoordination - rbnGoodOutCoverPowCoord) squared).
	
	Transcript show: ('Robustness : ', var asString); cr.
	
	^ (var / 12).



]

{ #category : #visualization }
AOEOrganization >> robustnessLine: aoeOrg withName: aoeOrgName [
	| dStandardMetrics dOrgMetrics xLabel builder bLegend |
	
	"prepare data"
	dStandardMetrics := #(1 1 0 0 0 0 1 1 1 1 1 1).	
	
	dOrgMetrics := OrderedCollection new.	
	dOrgMetrics add: aoeOrg completenessOfCoordinationStructure.
	dOrgMetrics add: aoeOrg connectednessOfCoordinationStructure.	
	dOrgMetrics add: aoeOrg univocityOfPowerStructure.	
	dOrgMetrics add: aoeOrg unilateralityOfCoordinationStructure.
	dOrgMetrics add: aoeOrg univocityOfControlStructure.	
	dOrgMetrics add: aoeOrg flatnessOfControlStructure.	
		
	dOrgMetrics add: aoeOrg overlapOfCoordinationOverPower.	
	dOrgMetrics add: aoeOrg chainOfControlOverPower.	
	dOrgMetrics add: aoeOrg chainOfControlOverCoordination.	
	dOrgMetrics add: aoeOrg incoverOfControlOverCoordination.		
	dOrgMetrics add: aoeOrg outcoverOfPowerOverControl.	
	dOrgMetrics add: aoeOrg outcoverOfPowerOverCoordination.	
	
	xLabel := OrderedCollection new.
	xLabel add: 'Completeness of Coordination'.
	xLabel add: 'Connectedness of Coordination'.
	xLabel add: 'Univocity of Power'.
	xLabel add: 'Unilaterality Of Coordination'.
	xLabel add: 'Univocity of Control'.
	xLabel add: 'Flatness of Control'.
	
	xLabel add: 'Overlap of Coordination over Power'.
	xLabel add: 'Chain of Control over Power'.
	xLabel add: 'Chain of Control over Coordination'.
	xLabel add: 'InCover of Control over Coordination'.
	xLabel add: 'OutCover of Power over Control'.
	xLabel add: 'OutCover of Power over Coordination'.
				
	"build"
	builder := RTKiviatBuilder new.
	builder extent: 350 @ 250.	
	builder interaction popup; highlight.		
	
	builder shape ellipse color: (Color red alpha: 0.3); size: 10.
	builder points: dStandardMetrics.
	builder connectDotColor: Color red.
	
	builder shape ellipse color: (Color black alpha: 0.3); size: 10.
	builder points: dOrgMetrics.
	builder connectDotColor: Color black.		
	
	builder allY: #yourself.
	
	builder stackX.
	
	builder axisConfiguration 
		title: 'Value'.
	builder axisY.
	
	builder axisConfiguration 
		title: 'Metric';
		labelRotation: -30;		
		numberOfTicks: 12;
		numberOfLabels: 12;
		labelConvertion: [ :v | xLabel at: v ifAbsent: '' ].
	builder axisX.	
	
	"defining the legend"	
	bLegend := RTLegendBuilder new.
	bLegend view: builder  view.
	bLegend addText: ('Measure the robustness of ', aoeOrgName asString).
	
	bLegend addColor: Color red 	text: 'Standard Robustness Metrics'.
	bLegend addColor: Color black 	text: 'Organization Robustness Metrics'.
	
	bLegend build.

	builder open.
	
]

{ #category : #accessing }
AOEOrganization >> roles [
	<MSEProperty: #roles type: #AOERole>
	<multivalued>
	^roles
]

{ #category : #visualization }
AOEOrganization >> threeCriteriaRadarChart: aoeOrg withName: aoeOrgName [
	
	| 	view		
		nbMetrics		
		dStandardMetrics dOrgMetrics xLabel |	

	view := RTView new @ RTDraggableView.
	
	"*** Robustness Criteria"
	view addMenu: 'Robustness' callback: [				
		nbMetrics := 12.
				
		"Prepare data"
		dStandardMetrics := #(1 1 0 0 0 0 1 1 1 1 1 1).	
	
		dOrgMetrics := OrderedCollection new.	
		dOrgMetrics add: aoeOrg completenessOfCoordinationStructure.
		dOrgMetrics add: aoeOrg connectednessOfCoordinationStructure.	
		dOrgMetrics add: aoeOrg univocityOfPowerStructure.	
		dOrgMetrics add: aoeOrg unilateralityOfCoordinationStructure.
		dOrgMetrics add: aoeOrg univocityOfControlStructure.	
		dOrgMetrics add: aoeOrg flatnessOfControlStructure.	
		
		dOrgMetrics add: aoeOrg overlapOfCoordinationOverPower.	
		dOrgMetrics add: aoeOrg chainOfControlOverPower.	
		dOrgMetrics add: aoeOrg chainOfControlOverCoordination.	
		dOrgMetrics add: aoeOrg incoverOfControlOverCoordination.		
		dOrgMetrics add: aoeOrg outcoverOfPowerOverControl.	
		dOrgMetrics add: aoeOrg outcoverOfPowerOverCoordination.	
	
		xLabel := OrderedCollection new.
		xLabel add: 'Completeness of Coordination'.
		xLabel add: 'Connectedness of Coordination'.
		xLabel add: 'Univocity of Power'.
		xLabel add: 'Unilaterality Of Coordination'.
		xLabel add: 'Univocity of Control'.
		xLabel add: 'Flatness of Control'.
	
		xLabel add: 'Overlap of Coordination over Power'.
		xLabel add: 'Chain of Control over Power'.
		xLabel add: 'Chain of Control over Coordination'.
		xLabel add: 'InCover of Control over Coordination'.
		xLabel add: 'OutCover of Power over Control'.
		xLabel add: 'OutCover of Power over Coordination'.
		
		view := self radarChartView: view withNbMetrics: nbMetrics withLabel: xLabel withStandardMetrics: dStandardMetrics withOrgMetrics: dOrgMetrics.
																		
		view signalUpdate.		
	].
	
	"*** Flexibility Criteria"	
	view addMenu: 'Flexibility' callback: [		
		nbMetrics := 6.
		
		"Prepare data"
		dStandardMetrics := #(0 0 1 1 1 1).	
	
		dOrgMetrics := OrderedCollection new.	
		dOrgMetrics add: aoeOrg completenessOfPowerStructure.
		dOrgMetrics add: aoeOrg connectednessOfPowerStructure.	
		dOrgMetrics add: aoeOrg chainOfControlOverPower.	
		dOrgMetrics add: aoeOrg completenessOfCoordinationStructure.
		dOrgMetrics add: aoeOrg connectednessOfCoordinationStructure.	
		dOrgMetrics add: aoeOrg outcoverOfPowerOverControl.	
				
	
		xLabel := OrderedCollection new.
		xLabel add: 'Completeness of Power'.
		xLabel add: 'Connectedness of Power'.
		xLabel add: 'Chain of Control over Power'.
		xLabel add: 'Completeness Of Coordination'.
		xLabel add: 'Connectedness of Coordination'.
		xLabel add: 'OutCover of Power over Control'.
		
		view := self radarChartView: view withNbMetrics: nbMetrics withLabel: xLabel withStandardMetrics: dStandardMetrics withOrgMetrics: dOrgMetrics.
																							
		view signalUpdate.
	].
	
	"*** Efficiency Criteria"
	view addMenu: 'Efficiency' callback: [		
		nbMetrics := 10.
			
		"Prepare data"
		dStandardMetrics := #(1 1 1 1 1 1 1 1 1 1).	
	
		dOrgMetrics := OrderedCollection new.	
		dOrgMetrics add: aoeOrg connectednessOfPowerStructure.
		dOrgMetrics add: aoeOrg economyOfPowerStructure.	
		dOrgMetrics add: aoeOrg economyOfCoordinationStructure.	
		dOrgMetrics add: aoeOrg overlapOfCoordinationOverPower.
		dOrgMetrics add: aoeOrg overlapOfPowerOverCoordination.	
		
		dOrgMetrics add: aoeOrg unilateralityOfPowerStructure.	
		dOrgMetrics add: aoeOrg univocityOfPowerStructure.	
		dOrgMetrics add: aoeOrg economyOfControlStructure.		
		dOrgMetrics add: aoeOrg overlapOfControlOverPower.	
		dOrgMetrics add: aoeOrg overlapOfPowerOverControl.	
	
		xLabel := OrderedCollection new.
		xLabel add: 'Completeness of Power'.
		xLabel add: 'Economy of Power'.
		xLabel add: 'Economy of Coordination'.
		xLabel add: 'Overlap Of Coordination over Power'.
		xLabel add: 'Overlap Of Power over Coordination'.
	
		xLabel add: 'Unilaterality of Power'.
		xLabel add: 'Univocity of Power'.
		xLabel add: 'Economy of Control'.
		xLabel add: 'Overlap of Control over Power'.
		xLabel add: 'Overlap of Power over Control'.				
		
		view := self radarChartView: view withNbMetrics: nbMetrics withLabel: xLabel withStandardMetrics: dStandardMetrics withOrgMetrics: dOrgMetrics.
																		
		view signalUpdate.
	].			

	view open.
	
]

{ #category : #visualization }
AOEOrganization >> tsunamiBPDGraphRepresentation [
	"Present the Tsunami Response plan under a BPD-Graph Representation"
	|  view	  
		nodeSize nodeColor edgeColor
		lstNodes lstNodeNames lstNodeLabels
		lstEdges lstEdgeNames lstEdgeLabels
		aNode  		
	|
	
	view := RTView new @ RTDraggableView.
	
	nodeSize := 5.		
	nodeColor := Color black alpha: 0.8.
	edgeColor := Color red alpha: 0.4.	
	
	lstNodes := OrderedCollection new.
	lstNodeNames := OrderedCollection new.
	lstNodeLabels := OrderedCollection new.
	
	lstEdges := OrderedCollection new.	
	lstEdgeNames := OrderedCollection new.
	lstEdgeLabels := OrderedCollection new.
	
	aNode := (RTEllipse new size: nodeSize; color: nodeColor) element.
	aNode @ RTLabelled.
	lstNodeNames add: 'O^{E}_{S}[1]'.
	lstNodeLabels add: 'Start Event of Pool: Institute of Geophysics'.
	lstNodes add: aNode.
	
	aNode := (RTEllipse new size: nodeSize; color: nodeColor) element.
	aNode @ RTLabelled.
	lstNodeNames add: 'O^{A}_{At}[1]'.
	lstNodeLabels add: 'T1: Detect tsunami risk'.
	lstNodes add: aNode.	
	
	lstEdges add: (RTLine new color: edgeColor; edgeFrom: (lstNodes at: 1) to: (lstNodes at: 2)).
	lstEdgeNames add: 'F^{S}[1]'.
	lstEdgeLabels add: 'Start Event 1 -> T1'.
	
	
	view addAll: lstNodes.
	view addAll: lstEdges.
	
	"We do a layout"
	RTForceBasedLayout new 
		charge: -500;
		on: view elements.
		
	view open.
]

{ #category : #visualization }
AOEOrganization >> tsunamiBPDGraphRepresentationV2 [
	"Present the Tsunami Response plan under a BPD-Graph Representation"
	| associations view labels |

	associations := OrderedCollection new.
	associations
		add: 'O^{E}_{S}[1]' 		-> 'O^{A}_{At}[1]';
		add: 'O^{A}_{At}[1]' 		-> 'O^{A}_{At}[2]';
		add: 'O^{A}_{At}[2]'		-> 'O^{E}_{I,Me}[1]';
		add: 'O^{E}_{I,Me}[1]'  	-> 'O^{E}_{I,T}[1]';
		add: 'O^{E}_{I,Me}[1]'  	-> 'O^{E}_{S}[2]';
		add: 'O^{E}_{I,T}[1]'  	-> 'O^{A}_{At}[3]';
		add: 'O^{A}_{At}[3]' 		-> 'O^{A}_{At}[4]';
		add: 'O^{A}_{At}[4]'		-> 'O^{E}_{I,Me}[2]';
		add: 'O^{E}_{I,Me}[2]'  	-> 'O^{E}_{I,Me}[3]';
		add: 'O^{E}_{I,Me}[2]'  	-> 'O^{E}_{E}[1]';
		add: 'O^{E}_{S}[2]' 		-> 'O^{A}_{At}[5]';
		add: 'O^{A}_{At}[5]' 		-> 'O^{G}_{A}[1]';
		add: 'O^{G}_{A}[1]' 		-> 'O^{A}_{At}[6]';	
		add: 'O^{G}_{A}[1]' 		-> 'O^{A}_{At}[7]';
		add: 'O^{A}_{At}[6]' 		-> 'O^{G}_{A}[2]';															
		add: 'O^{A}_{At}[7]' 		-> 'O^{G}_{A}[2]';
		add: 'O^{A}_{At}[7]' 		-> 'O^{G}_{A}[3]';
		add: 'O^{G}_{A}[2]' 		-> 'O^{E}_{I,Me}[3]';	
		add: 'O^{E}_{I,Me}[3]' 	-> 'O^{A}_{At}[8]';
		add: 'O^{A}_{At}[8]' 		-> 'O^{A}_{At}[9]';	
		add: 'O^{A}_{At}[9]' 		-> 'O^{G}_{A}[4]';	
		add: 'O^{A}_{At}[9]' 		-> 'O^{G}_{A}[5]';
		add: 'O^{G}_{A}[5]' 		-> 'O^{A}_{At}[10]';
		add: 'O^{A}_{At}[10]' 	-> 'O^{E}_{E}[2]';	
		add: 'O^{G}_{A}[3]' 		-> 'O^{A}_{At}[11]';
		add: 'O^{A}_{At}[11]' 	-> 'O^{G}_{A}[2]';
		add: 'O^{G}_{A}[3]' 		-> 'O^{A}_{At}[12]';
		add: 'O^{A}_{At}[12]' 	-> 'O^{G}_{A}[2]';
					
		add: 'O^{G}_{A}[3]' 		-> 'O^{G}_{A}[6]';
		add: 'O^{G}_{A}[6]' 		-> 'O^{A}_{At}[13]';
		add: 'O^{G}_{A}[6]' 		-> 'O^{A}_{At}[14]';
		add: 'O^{G}_{A}[6]' 		-> 'O^{A}_{At}[15]';
		add: 'O^{A}_{At}[13]' 	-> 'O^{G}_{A}[7]';	
		add: 'O^{A}_{At}[14]' 	-> 'O^{G}_{A}[7]';
		add: 'O^{A}_{At}[15]' 	-> 'O^{G}_{A}[7]';	
		add: 'O^{G}_{A}[7]' 		-> 'O^{G}_{A}[2]';								
		add: 'O^{G}_{A}[4]' 		-> 'O^{G}_{A}[8]';
		add: 'O^{G}_{A}[8]' 		-> 'O^{A}_{At}[16]';
		add: 'O^{G}_{A}[8]' 		-> 'O^{A}_{At}[17]';
		add: 'O^{A}_{At}[16]' 	-> 'O^{G}_{A}[9]';	
		add: 'O^{A}_{At}[17]' 	-> 'O^{G}_{A}[9]';
		add: 'O^{G}_{A}[9]' 		-> 'O^{G}_{A}[5]';		
						
		
		add: 'O^{G}_{A}[3]' 		-> 'O^{G}_{A}[10]';
		add: 'O^{G}_{A}[10]' 		-> 'O^{A}_{At}[18]';
		add: 'O^{G}_{A}[10]' 		-> 'O^{A}_{At}[19]';
		add: 'O^{G}_{A}[10]' 		-> 'O^{A}_{At}[20]';
		add: 'O^{A}_{At}[18]' 	-> 'O^{G}_{A}[11]';	
		add: 'O^{A}_{At}[19]' 	-> 'O^{G}_{A}[11]';
		add: 'O^{A}_{At}[20]' 	-> 'O^{G}_{A}[11]';	
		add: 'O^{G}_{A}[11]' 		-> 'O^{G}_{A}[2]';								
		add: 'O^{G}_{A}[4]' 		-> 'O^{G}_{A}[12]';
		add: 'O^{G}_{A}[12]' 		-> 'O^{A}_{At}[21]';
		add: 'O^{G}_{A}[12]' 		-> 'O^{A}_{At}[22]';
		add: 'O^{A}_{At}[21]' 	-> 'O^{G}_{A}[13]';	
		add: 'O^{A}_{At}[22]' 	-> 'O^{G}_{A}[13]';
		add: 'O^{G}_{A}[13]' 		-> 'O^{G}_{A}[5]';	
					
		add: 'O^{G}_{A}[3]' 		-> 'O^{G}_{X}[1]';
		add: 'O^{G}_{X}[1]' 		-> 'O^{A}_{At}[23]';
		add: 'O^{G}_{X}[1]' 		-> 'O^{A}_{At}[24]';
		add: 'O^{A}_{At}[23]' 	-> 'O^{G}_{X}[2]';	
		add: 'O^{A}_{At}[24]' 	-> 'O^{G}_{X}[2]';
		add: 'O^{G}_{X}[2]' 		-> 'O^{G}_{A}[2]';
		
		add: 'O^{P}[1]' 		-> 'O^{P}[1]';
		add: 'O^{P}[2]' 		-> 'O^{P}[2]';		
		add: 'O^{L}[1]' 		-> 'O^{L}[1]';
		add: 'O^{L}[2]' 		-> 'O^{L}[2]';
		add: 'O^{L}[3]' 		-> 'O^{L}[3]';	
		add: 'O^{L}[4]' 		-> 'O^{L}[4]';	
		add: 'O^{L}[5]' 		-> 'O^{L}[5]';	
		add: 'O^{L}[6]' 		-> 'O^{L}[6]'.


	"We create the nodes"
	view := RTView new.
	view @ RTDraggableView.
	labels := Set new.
	associations do: [ :assoc | labels add: assoc key; add: assoc value ].
	
	labels do: [ :aLabel |
		| n |
		n := view elementFromModel: aLabel.
		n ifNil: [ n := (RTBox new + RTLabel) elementOn: aLabel. n @ RTDraggable ].
		view add: n.
	].

	"We add the links"
	RTEdge buildEdgesFromObjects: associations 
		from: #key 
		to: #value 
		using: ((RTLine new attachPoint: RTShorterDistanceAttachPoint new; color: Color veryDarkGray) + (RTSimpleArrowHead new attachPoint: RTShorterDistanceAttachPoint new; color: Color veryDarkGray)) 
		inView: view.
	

	"We do a layout"
	"RTForceBasedLayout new 
		charge: -500;
		on: view elements."
	RTHorizontalTreeLayout on: view elements.	

	view open.	
]

{ #category : #'metrics-control' }
AOEOrganization >> unilateralityOfControlStructure [
	| tmp |
	tmp := (self numberOfControlSIM) / (self numberOfControlRelations).
	^ 1 - tmp
]

{ #category : #'metrics-coordination' }
AOEOrganization >> unilateralityOfCoordinationStructure [
	| tmp |
	tmp := (self numberOfCoordinationSIM) / (self numberOfCoordinationRelations).
	^ 1 - tmp
]

{ #category : #'metrics-power' }
AOEOrganization >> unilateralityOfPowerStructure [
	| tmp val|
	val := (self numberOfPowerRelations).
	val = 0 ifTrue:[ val := 1].
	tmp := (self numberOfPowerSIM) / val.
	^ 1 - tmp
]

{ #category : #'metrics-control' }
AOEOrganization >> univocityOfControlStructure [
	^ (self numberOfControlIN) / (self numberOfControlRoles)
]

{ #category : #'metrics-coordination' }
AOEOrganization >> univocityOfCoordinationStructure [
	^ (self numberOfCoordinationIN) / (self numberOfCoordinationRoles)
]

{ #category : #'metrics-power' }
AOEOrganization >> univocityOfPowerStructure [
	|numberOfPowerIN numberOfPowerRoles|
	
	numberOfPowerIN :=  (self numberOfPowerIN).
	numberOfPowerRoles := (self numberOfPowerRoles).
	numberOfPowerRoles = 0 ifTrue:[ numberOfPowerRoles := 1].
	^  numberOfPowerIN / numberOfPowerRoles.
]
