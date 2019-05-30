counting-coordination
numberOfCoordinationDisconnectedPairs
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