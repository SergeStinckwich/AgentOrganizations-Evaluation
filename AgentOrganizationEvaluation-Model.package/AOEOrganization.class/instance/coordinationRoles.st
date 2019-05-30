accessing
coordinationRoles
	"Return the collection of roles involving the coordination relation"

	| coordinationSet |	
	
	"count the number of roles involved the coordination relations
	implemented by daidungsi 08.10.2014"
	
	coordinationSet := OrderedCollection new.
	
	"collection of AOERoles that have number of coordination relations bigger than 1"	
	self roles do: [:role | (role coordinationRelations size > 0) ifTrue: [role coordinationRelations do: [:cpRole | (coordinationSet includes: cpRole) ifFalse: [coordinationSet add: cpRole] ]. (coordinationSet includes: role) ifFalse: [coordinationSet add: role] ] ].
	
	^coordinationSet