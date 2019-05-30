visualization
tsunamiBPDGraphRepresentation
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