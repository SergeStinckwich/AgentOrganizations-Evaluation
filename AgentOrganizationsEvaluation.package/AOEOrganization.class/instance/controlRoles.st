accessing
controlRoles
	"Return the collection of roles involving the control relation"
	
	| controlSet |	
	
	"count the number of roles involved the control relations
	implemented by daidungsi 08.10.2014"
	
	controlSet := OrderedCollection new.
	
	"collection of AOERoles that have number of control relations bigger than 1"	
	"self roles do: [ :role | (role controlRelations size > 0) ifTrue: [role controlRelations do: [ :cpRole | controlSet add: cpRole]. controlSet add: role] ]."
	
	self roles do: [:role | (role controlRelations size > 0) ifTrue: [role controlRelations do: [:cpRole | (controlSet includes: cpRole) ifFalse: [controlSet add: cpRole] ]. (controlSet includes: role) ifFalse: [controlSet add: role] ] ].
	
	^controlSet
	