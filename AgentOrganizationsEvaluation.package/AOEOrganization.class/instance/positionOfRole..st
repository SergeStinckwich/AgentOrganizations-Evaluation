accessing
positionOfRole: aRole
	"Get the position of a role in collection of roles"
	| position number|	 
	
	number := 0.
	self roles do: [:each | 
		number := number + 1.
		(aRole = each ) ifTrue: [ position := number ]
	].

	^ position