counting-power
numberOfPowerDisconnectedPairs
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