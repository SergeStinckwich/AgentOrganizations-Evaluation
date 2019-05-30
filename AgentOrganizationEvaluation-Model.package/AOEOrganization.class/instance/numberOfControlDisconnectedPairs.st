counting-control
numberOfControlDisconnectedPairs
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