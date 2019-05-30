accessing
powerRoles
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