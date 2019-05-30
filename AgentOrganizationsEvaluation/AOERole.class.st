"
AOERole represent a role in an organizational structure following the model proposed in the paper  ""Structural Aspects of the Evaluation of Agent Organizations"" by D. Grossi, F. Dignum, V. Dignum, M. Dastani and L.Royakkers.

Each role has links with 3 kinds of roles, related to the following roles structures:
- power structure: defines the task delegation patterns possible within the organization 
- coordination structure:  concerns the flow of knowledge within the organisation
- control structure: has finally to do with the task recovery functions of the organization.



"
Class {
	#name : #AOERole,
	#superclass : #Object,
	#instVars : [
		'roleName',
		'roleColor',
		'coordinationRelations',
		'controlRelations',
		'powerRelations'
	],
	#category : 'AgentOrganizationsEvaluation-Model'
}

{ #category : #adding }
AOERole >> addControlRelations: aRole [
	controlRelations add: aRole
]

{ #category : #adding }
AOERole >> addCoordinationRelations: aRole [
	coordinationRelations add: aRole
]

{ #category : #adding }
AOERole >> addPowerRelations: aRole [
	powerRelations add: aRole
]

{ #category : #adding }
AOERole >> addRoleColor: aColor [
	roleColor := aColor
]

{ #category : #adding }
AOERole >> addRoleName: aName [
	roleName := aName
]

{ #category : #accessing }
AOERole >> controlRelations [
	^ controlRelations
]

{ #category : #accessing }
AOERole >> coordinationRelations [
	^ coordinationRelations
]

{ #category : #initialization }
AOERole >> initialize [
	roleName := String new.
	roleColor := 0.
	powerRelations 	:= OrderedCollection new.
	controlRelations := OrderedCollection new.
	coordinationRelations := OrderedCollection new.
]

{ #category : #counting }
AOERole >> numberOfControlOutdegree [
	"Count the outdegree of each node in control relations"
	
	| number |
	number := 0.
	self controlRelations do: [ :aRole | number := number + 1 ].
	^ number


]

{ #category : #counting }
AOERole >> numberOfCoordinationOutdegree [
	"Count the outdegree of each node in coordination relations"
	
	| number |	
	
	number := 0.
	self coordinationRelations do: [ :aRole | number := number + 1 ].		
	^ number


]

{ #category : #counting }
AOERole >> numberOfPowerOutdegree [
	"Count the outdegree of each node in power relations"
	
	| number |	
	number := 0.
	self powerRelations do: [ :aRole | number := number + 1 ].		
	^ number


]

{ #category : #accessing }
AOERole >> powerRelations [

	^ powerRelations
]

{ #category : #accessing }
AOERole >> roleColor [

	^ roleColor
]

{ #category : #accessing }
AOERole >> roleName [
	^ roleName
]
